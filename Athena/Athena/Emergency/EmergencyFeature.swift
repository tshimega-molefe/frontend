//
//  EmergencyFeature.swift
//  Athena
//
//  Created by Dev Jacobson on 2022/11/13.
//

import Foundation
import ComposableArchitecture
import CoreLocation
import ServiceMap

struct EmergencyFeature: ReducerProtocol {
    
    struct State: Equatable {
        var isPresented = true
        var route: Route = .confirming
        var connectivityState = ConnectivityState.disconnected
        var serviceRequestFeature: ServiceRequestFeature.State?
        var mapFeature: MapFeature.State?
        var emergency: EmergencyModel = EmergencyModel()
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
        case mapAction(MapFeature.Action)
        case onAppear
        case cancel
        case connectOrDisconnect
        case sendResponse(didSucceed: Bool)
        case webSocket(WebSocketClient.Action)
        case receivedSocketMessage(TaskResult<WebSocketClient.Message>)
    }
    
    @Dependency(\.websocket) private var websocket
    @Dependency(\.mainQueue) private var mainQueue
    
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            
            enum WebSocketID {}
            
            switch action {
                
            case .serviceRequestAction(.confirm):
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
                state.mapFeature = MapFeature.State(mapMode: .citizen)
                state.serviceRequestFeature = ServiceRequestFeature.State()
                return .none
                
            case .cancel:
                //state.serviceRequestFeature = nil
                
                if state.serviceRequestFeature?.route != .idle {
                    let messageToSend = "{\"type\": \"cancel.emergency\", \"id\": \"\(state.emergency.id ?? "")\"}"
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
                    
                    let decoder = JSONDecoder()
                    state.emergency = try! decoder.decode(EmergencyModel.self, from: string.data(using: .utf8)!)
                    
                    let type = state.emergency.type ?? ""
                    
                    switch type {
                        
                    case "renew.emergency":
                        switch state.emergency.status {
                        case "ACCEPTED":
                            
                            state.serviceRequestFeature?.route = .accepted
                            return .none
                            
                        case "IN PROGRESS":
                            state.serviceRequestFeature?.route = .started
                            
                        case "REQUESTED":
                            state.serviceRequestFeature?.route = .confirmed
                            
                        default:
                            return .none
                            
                        }
                        
                        
                    case "cancel.emergency":
                        state.mapFeature?.securityLocation = nil
                        
                        return .task {
                            return .connectOrDisconnect
                        }
                        
                    case "start.emergency":
                        return .task {
                            return .serviceRequestAction(.start)
                        }
                        
                    case "accept.emergency":
                        return .task {
                            return .serviceRequestAction(.accept)
                        }
                        
                    case "update.emergency":
                        
                        if let security = state.emergency.security {
                            return .task { [securityCoordinate = security.coordinate] in
                                
                                let lat = securityCoordinate.latitude
                                let long = securityCoordinate.longitude
                                let coordinate = CLLocationCoordinate2DMake(lat, long)
                                
                                return .mapAction(.updateSecurityLocation(coordinate))
                            }
                        }
                        
                    case "complete.emergency":
                        
                        state.mapFeature?.securityLocation = nil
                        
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
                
            case .mapAction(.calculateRoute(_, _)):
                return .none
            case .mapAction(.longPress(_)):
                return .none
            case .mapAction(.routeResponse(_)):
                return .none
            case .mapAction(.getDirections):
                return .none
            case .mapAction(.removeCitizen):
                return .none
                
            case let .mapAction(.updateCitizenLocation(newCoordinate)):
                
                
                let messageToSend = "{\"type\": \"update.location\", \"citizen\": { \"coordinate\": { \"latitude\": \(newCoordinate.latitude), \"longitude\": \(newCoordinate.longitude) } } }"
                
                return .task {
                    try await websocket.send(WebSocketID.self, .string(messageToSend))
                    return .sendResponse(didSucceed: true)
                } catch: { _ in
                        .sendResponse(didSucceed: false)
                }
                .cancellable(id: WebSocketID.self)
                
            case .mapAction(.updateSecurityLocation(_)):
                return .none
            }
        }
        .ifLet(\.mapFeature, action: /Action.mapAction) {
            MapFeature()
        }
        .ifLet(\.serviceRequestFeature, action: /Action.serviceRequestAction) {
            ServiceRequestFeature()
        }
    }
}
