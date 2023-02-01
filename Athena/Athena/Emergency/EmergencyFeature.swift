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
    
    @Dependency(\.websocket) private var websocket
    @Dependency(\.mainQueue) private var mainQueue
        
    struct State: Equatable {
        var shouldDismiss = true
        var emergency = EmergencyModel()
        var route: Route = .confirming
        var connectivityState = ConnectivityState.disconnected
        var serviceRequest = ServiceRequestFeature.State()
        var map = MapFeature.State(mapMode: .citizen)
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
        case cancel
        case map(MapFeature.Action)
        case serviceRequest(ServiceRequestFeature.Action)
        case connectOrDisconnect
        case sendResponse(didSucceed: Bool)
        case websocket(WebSocketClient.Action)
        case receivedSocketMessage(TaskResult<WebSocketClient.Message>)
    }
    
    var body: some ReducerProtocol<State, Action> {
        
        Scope(state: \.map, action: /Action.map) {
            MapFeature()
        }
        
        Scope(state: \.serviceRequest, action: /Action.serviceRequest) {
            ServiceRequestFeature()
        }
      
        
        Reduce { state, action in
            
            enum WebSocketID {}
            
            switch action {
                
            case .cancel:
                state.shouldDismiss = true
                
                if state.serviceRequest.route != .idle {
                    state.serviceRequest.route = .idle
                    
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
                    return .none
                }
                
                /*
                 -------------------
                 Websocket actions
                 -------------------
                 */
            case .connectOrDisconnect:
                switch state.connectivityState {

                case .connected, .connecting:
                    state.connectivityState = .disconnected
                    return .cancel(id: WebSocketID.self)

                case .disconnected:

                    state.connectivityState = .connecting

                    return .run { send in
                        let actions = await websocket.open(WebSocketID.self, URL(string: "ws://localhost:8000")!, [])

                        await withThrowingTaskGroup(of: Void.self) { taskGroup in
                            for await action in actions {
                                await send(.websocket(action))

                                switch action {

                                case .didOpen:
                                    taskGroup.addTask {
                                        //TODO: ensure that errors are checked and handled with respect to the access token
                                        let accessToken: UserToken
                                        
                                        if let tokenData = KeychainHelper.standard.read(service: "user-token"){
                                            print("DEBUG: GOT AN ACCESS TOKEN")
                                            accessToken = try! JSONDecoder().decode(UserToken.self, from: tokenData)
                                            
                                        }
                                        else {
                                            accessToken = UserToken(access: "", refresh: "")
                                            print("DEBUG: No webSocket access token found in keychain")
                                        }
                                        
                                        let messageToSend = "{\"token\": \" \(accessToken.access)\"}"
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

            case .sendResponse(didSucceed: true):
              return .none

            case .sendResponse(didSucceed: false):
                return .none

            case .websocket(.didOpen):
                state.connectivityState = .connected
                return .none

            case .websocket(.didClose):
                state.connectivityState = .disconnected
                return .cancel(id: WebSocketID.self)

            case let .receivedSocketMessage(.success(message)):
                if case let .string(string) = message {

                    let decoder = JSONDecoder()
                    //TODO: Add a do catch block here for when it fails (shouldnt but still)
                    state.emergency = try! decoder.decode(EmergencyModel.self, from: string.data(using: .utf8)!)
                    let type = state.emergency.type ?? ""

                    switch type {

                    case "renew.emergency":
                        switch state.emergency.status {
                        case "ACCEPTED":
                            state.serviceRequest.route = .accepted
                            return .none
                        case "IN PROGRESS":
                            state.serviceRequest.route = .started
                        case "REQUESTED":
                            state.serviceRequest.route = .confirmed
                        default:
                            return .none
                        }

                    case "cancel.emergency":
                        state.map.securityLocation = nil
                        
                    case "start.emergency":
                        return .task {
                            return .serviceRequest(.start)
                        }

                    case "accept.emergency":
                        return .task {
                            .serviceRequest(.accept)
                        }

                    case "update.emergency":
                        if let security = state.emergency.security {
                            return .task { [securityCoordinate = security.coordinate] in

                                let lat = securityCoordinate.latitude
                                let long = securityCoordinate.longitude
                                let coordinate = CLLocationCoordinate2DMake(lat, long)

                                return .map(.updateSecurityLocation(coordinate))
                            }
                        }

                    case "complete.emergency":
                        state.map.securityLocation = nil

                        return .run { send in
                            await send(.serviceRequest(.complete))
                        }
                    default:
                        return .none
                    }
                }

                return .none

            case .receivedSocketMessage(.failure):
                return .none

//                /*
//                 -------------
//                 Map Actions
//                 -------------
//                 */
            case let .map(.updateCitizenLocation(newCoordinate)):

                let messageToSend = "{\"type\": \"update.location\", \"citizen\": { \"coordinate\": { \"latitude\": \(newCoordinate.latitude), \"longitude\": \(newCoordinate.longitude) } } }"
                //
                return .task {
                    try await websocket.send(WebSocketID.self, .string(messageToSend))
                    return .sendResponse(didSucceed: true)
                } catch: { _ in
                        .sendResponse(didSucceed: false)
                }
                .cancellable(id: WebSocketID.self)
            case .map:
                return .none
//
            /*
             -------------------------
             Service request actions
             -------------------------
             */
                
            case .serviceRequest(.confirm):
                state.shouldDismiss = false

                let messageToSend = "{\"type\": \"create.emergency\"}"

                return .task {
                    print("DEBUG: SENDING CREATION: \(messageToSend)")
                    try await websocket.send(WebSocketID.self, .string(messageToSend))
                    return .sendResponse(didSucceed: true)
                } catch: { _ in
                        .sendResponse(didSucceed: false)
                }
                .cancellable(id: WebSocketID.self)
                
            case .serviceRequest(.complete):
                state.shouldDismiss = true
                return .none
                
            case .serviceRequest:
                return .none


                
            }
        }
    }
}
