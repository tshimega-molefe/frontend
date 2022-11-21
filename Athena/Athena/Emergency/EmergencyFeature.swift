//
//  EmergencyFeature.swift
//  Athena
//
//  Created by Dev Jacobson on 2022/11/13.
//

import ComposableArchitecture
import Foundation

struct EmergencyFeature: ReducerProtocol {
    
    struct State: Equatable {
        var isPresented = true
        var route: Route = .confirming
        var connectivityState = ConnectivityState.disconnected
        var serviceRequestFeature: ServiceRequestFeature.State?
        var emergency: EmergencyModel?
    }
    
    enum Route: Equatable {
        case confirming
        case requested
        case accepted
    }
    
    enum ConnectivityState: String {
        case connected
        case connecting
        case disconnected
    }
    
    enum Action: Equatable {
        case serviceRequestAction(ServiceRequestFeature.Action)
        case onAppear
        case cancel
        case connectOrDisconnect
        case sendResponse(didSucceed: Bool)
        case webSocket(WebSocketClientComposable.Action)
        case receivedSocketMessage(TaskResult<WebSocketClientComposable.Message>)
    }
    
    @Dependency(\.websocket) private var websocket
    @Dependency(\.mainQueue) private var mainQueue
    
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            
            enum WebSocketID {}
            
            switch action {
                
            case .serviceRequestAction(.confirm):
                //let messageToSend = state.messageToSend
                //state.messageToSend = ""
                let messageToSend = "{\"type\": \"create.emergency\"}"
                return .task {
                    print("DEBUG: SENDING CREATION: \(messageToSend)")
                    try await websocket.send(WebSocketID.self, .string(messageToSend))
                    return .sendResponse(didSucceed: true)
                } catch: { _ in
                        .sendResponse(didSucceed: false)
                }
                .cancellable(id: WebSocketID.self)
                
                
            case .serviceRequestAction(.accept):
                return .none
                
            case .serviceRequestAction(.start):
                return .none
                
            case .serviceRequestAction(.complete):
                return .none
                
            case .serviceRequestAction(.updatePaymentMethod):
                return .none
                
                
            case .onAppear:
                state.isPresented = true
                state.serviceRequestFeature = ServiceRequestFeature.State()
                return .none
                
            case .cancel:
                if state.serviceRequestFeature?.route != .idle {
                    let messageToSend = "{\"type\": \"cancel.emergency\", \"id\": \"\(state.emergency?.id ?? "")\"}"
                    return .task {
                        print("DEBUG: SENDING CANCELLATION: \(messageToSend)")
                        try await websocket.send(WebSocketID.self, .string(messageToSend))
                        return .sendResponse(didSucceed: true)
                    } catch: { _ in
                            .sendResponse(didSucceed: false)
                    }
                        .cancellable(id: WebSocketID.self)
                }
                else {
                    state.isPresented = false
                    return .task {
                        return .connectOrDisconnect
                    }
                }
                
                
            case .connectOrDisconnect:
                switch state.connectivityState {
                    
                case .connected, .connecting:
                    
                    state.connectivityState = .disconnected
                    state.isPresented = false
                    
                    return .cancel(id: WebSocketID.self)
                    
                case .disconnected:
                    
                    state.connectivityState = .connecting
                    
                    return .run { send in
                        let actions = await websocket.open(WebSocketID.self, URL(string: "ws://localhost:8000")!, [])
                        
                        await withThrowingTaskGroup(of: Void.self) { taskGroup in
                            for await action in actions {
                                await send(.webSocket(action))
                                
                                switch action {
                                case .didOpen:
                                    taskGroup.addTask {
                                        
                                        let accessToken: String
                                        
                                        if let data = KeychainHelper.standard.read(service: "access-token"){
                                            if let token = String(data: data, encoding: .utf8){
                                                print("DEBUG: GOT AN ACCESS TOKEN")
                                                accessToken = token
                                            }
                                            else {
                                                accessToken = ""
                                                print("DEBUG: Something went wrong setting access token string value")
                                            }
                                        }
                                        else {
                                            accessToken = ""
                                            print("DEBUG: No webSocket access token found in keychain")
                                        }
                                        
                                        let messageToSend = "{\"token\": \" \(accessToken)\"}"
                                        try await websocket.send(WebSocketID.self, .string(messageToSend))
                                        
                                        while true {
                                            try await mainQueue.sleep(for: .seconds(10))
                                            try await websocket.sendPing(WebSocketID.self)
                                        }
                                    }
                                    taskGroup.addTask {
                                        for await result in try await websocket.receive(WebSocketID.self) {
                                            await send(.receivedSocketMessage(result))
                                        }
                                    }
                                    
                                case .didClose:
                                    return
                                }
                            }
                        }
                    } catch: { _, _ in
                    }
                    .cancellable(id: WebSocketID.self)
                }
                
            case .sendResponse(didSucceed: let didSucceed):
                print(didSucceed)
                return .none
                
            case .webSocket(.didOpen):
                state.connectivityState = .connected
                return .none
                
            case .webSocket(.didClose):
                
                state.connectivityState = .disconnected
                return .cancel(id: WebSocketID.self)
                
                
            case let .receivedSocketMessage(.success(message)):
                if case let .string(string) = message {
                    
                    print(string)
                    let decoder = JSONDecoder()
                    state.emergency = try! decoder.decode(EmergencyModel.self, from: string.data(using: .utf8)!)
                    
                    let type = state.emergency?.type ?? ""
                    
                    switch type {
                        
                    case "cancel.emergency":
                        return .task {
                            return .connectOrDisconnect
                        }
                        
                    case "start.emergency":
                        return .task {
                            return .serviceRequestAction(.start)
                        }
                        
                    case "complete.emergency":
                        return .task {
                            return .serviceRequestAction(.complete)
                        }
                        
                    default:
                        return .none
                    }
                }
                
                return .none
                
                
            case .receivedSocketMessage(.failure):
                return .none
                
            }
        }
        .ifLet(\.serviceRequestFeature, action: /Action.serviceRequestAction) {
            ServiceRequestFeature()
        }
    }
}
