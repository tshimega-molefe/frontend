//
//  MainTabView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/26.
//

import SwiftUI


struct MainTabView: View {
    
    @EnvironmentObject var userAuth: AuthViewModel
    
//  MARK: - Properties
    
// Presentation logic
    var body: some View {
        Group {
            if !userAuth.isAuthenticated {
                LoginView()
            } else {
                // Open WebSocket with Access Token
                mainInterfaceView
            }
        }
    }
}

//  MARK: Lifecycle

//  MARK: Extensions

extension MainTabView {
    
    var mainInterfaceView: some View {
        ZStack {
            TabView(selection: $userAuth.selectedIndex) {
                
                StatusView()
                    .onTapGesture {
                        self.userAuth.selectedIndex = 0
                    }
                    .tabItem {
                        Image(systemName: "location.circle")
                        Text("Status")
                    }.tag(0)
                
                SecurityView()
                    .onTapGesture {
                        self.userAuth.selectedIndex = 1
                    }
                    .tabItem {
                        Image(systemName: "waveform.path.ecg")
                        Text("Security")
                    }.tag(1)
                PressForHelpView()
                    .onTapGesture {
                        self.userAuth.selectedIndex = 2
                    }
                    .tabItem {
                        Image(systemName: "cross.circle")
                        Text("Help")
                    }.tag(2)
                SearchView()
                    .onTapGesture {
                        self.userAuth.selectedIndex = 3
                    }
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }.tag(3)
                SettingsView()
                    .onTapGesture {
                        self.userAuth.selectedIndex = 4
                    }
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Settings")
                    }.tag(4)
            }
        }
    }
    
}
