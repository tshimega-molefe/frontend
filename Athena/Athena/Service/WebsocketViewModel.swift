//
//  WebsocketViewModel.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/10/20.
//

import Foundation
import Combine
import SwiftUI

class WebSocketViewModel: UIResponder, UIApplicationDelegate, WebSocketConnectionDelegate, ObservableObject {
    func onConnected(connection: WebSocketConnection) {
        print("DEBUG: WebSocket Connected..")
    }
    
    func onDisconnect(connection: WebSocketConnection, error: Error?) {
        if let error = error {
            print("DEBUG: Disconnected with error:\(error)..")
        } else {
            print("DEBUG: Disconnected normally..")
        }
    }
    
    func onError(connection: WebSocketConnection, error: Error) {
        print("DEBUG: Connection error:\(error)..")
    }
    
    func onMessage(connection: WebSocketConnection, text: String) {
        print("DEBUG: Text Message: \(text)..")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.webSocketConnection.send(text: "DEBUG: Ping..")
        }
    }
    
    func onMessage(connection: WebSocketConnection, data: Data) {
        print("DEBUG: Data message: \(data)")
    }
                   
    var webSocketConnection: WebSocketConnection!
    
// Below functions are normally used in a swift only application. I think I might be overriding the @Main call in Athena/App/AthenaApp/
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        webSocketConnection = WebSocketTaskConnection(url: URL(string: "ws://localhost:8000")!)
        webSocketConnection.delegate = self
        
        webSocketConnection.connect()
        
        webSocketConnection.send(text: "DEBUG: Ping..")
        
        return true
    }
              
    // MARK: - UISceneSession Lifecylce
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Callled when a new scene session is being created
        //Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "DEBUG: Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
}
