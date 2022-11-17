//
//  WebsocketFeature.swift
//  Athena
//
//  Created by Dev Jacobson on 2022/11/16.
//

import Foundation
import ComposableArchitecture

struct WebsocketFeature: ReducerProtocol {
    struct State: Equatable {
        var connectivityState = ConnectivityState.disconnected
    }
    
    enum ConnectivityState: String {
      case connected
      case connecting
      case disconnected
    }
    
    enum Action: Equatable {
        case connect
        case disconnect
        case receivedSocketMessage(TaskResult<WebSocketClient.Message>)

    }
    
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            default:
                return .none
            }
        }
    }
}
