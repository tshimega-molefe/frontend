//
//  AthenaApp.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/25.
//

import SwiftUI
import ComposableArchitecture

@main
struct AthenaApp: App {
    
    @StateObject var userAuth = AuthViewModel()
    @StateObject var wsViewModel = WebSocketViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeTabView()
            .environmentObject(userAuth)
            .environmentObject(wsViewModel)
        }
    }
}
