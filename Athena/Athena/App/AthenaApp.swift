//
//  AthenaApp.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/25.
//

import SwiftUI

@main
struct AthenaApp: App {
    
    @StateObject var userAuth = AuthViewModel()
    @StateObject var locationViewModel = LocationSearchViewModel()
    // FIX: Potential incorrect use of stateObject of the WebSocketViewModel..
    @StateObject var wsViewModel = WebSocketViewModel()
    
    
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MainTabView()
            }
            .environmentObject(locationViewModel)
            .environmentObject(userAuth)
            .environmentObject(wsViewModel)
        }
    }
}
