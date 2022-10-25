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
    
    
         
    // MARK: - UISceneSession Lifecylce
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Callled when a new scene session is being created
        //Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "DEBUG: Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
}
