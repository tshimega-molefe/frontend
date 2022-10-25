//
//  WebsocketViewModel.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/10/20.
//

import Foundation
import Combine
import SwiftUI

class WebSocketViewModel: UIResponder, UIApplicationDelegate, ObservableObject {
    var webSocketConnection = WebsocketClient.shared
    
    func subscribeToService() {
        if !webSocketConnection.opened {
            webSocketConnection.openWebSocket()
        }
    }
    
    func closeService() {
        if webSocketConnection.opened {
            webSocketConnection.closeWebSocket()
        }
    }
    
}
