//
//  MainTabView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/26.
//

import SwiftUI


struct HomeTabView: View {
    //  MARK: - Properties
    enum Tab {
        case status
        case security
        case emergency
        case search
        case settings
    }
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var userAuth: AuthViewModel
    @EnvironmentObject var wsViewModel: WebSocketViewModel
    
    @State private var selectedTab: Tab = .emergency
    
    // Presentation logic
    var body: some View {
        
        Group {
            if !userAuth.isAuthenticated {
                LoginView()
            } else {
                // Open WebSocket with Access Token
                let _ = wsViewModel.subscribeToService()
                
                mainInterfaceView
            }
        }
    }
    
    func callLogin() {
        print(userAuth.isAuthenticated)
    }
}

//  MARK: Lifecycle

//  MARK: Extensions

extension TabView {
    
    var mainInterfaceView: some View {
        
        TabView(selection: $selectedTab) {
            StatusView()
                .tabItem {
                    Image(systemName: "location.circle")
                    Text("Status")
                }.tag(Tab.status)
            
            SecurityView(locationService: LocationSearchService())
                .tabItem {
                    Image(systemName: "waveform.path.ecg")
                    Text("Security")
                }.tag(Tab.security)
            
            NavigationView {
                EmergencyView()
            }
            .tabItem {
                Image(systemName: "cross.circle")
                Text("Help")
            }.tag(Tab.emergency)
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }.tag(Tab.search)
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }.tag(Tab.settings)
        }
    }
}
