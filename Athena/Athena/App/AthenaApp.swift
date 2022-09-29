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
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MainTabView(userAuth: userAuth)
            }
        }
    }
}