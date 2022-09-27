//
//  MainTabView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/26.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 2
    
    
    var body: some View {
            TabView(selection: $selectedIndex) {
                
                StatusView()
                    .onTapGesture {
                        self.selectedIndex = 0
                    }
                    .tabItem {
                        Image(systemName: "location.circle")
                        Text("Status")
                    }.tag(0)
                
                SecurityView()
                    .onTapGesture {
                        self.selectedIndex = 1
                    }
                    .tabItem {
                        Image(systemName: "waveform.path.ecg")
                        Text("Security")
                    }.tag(1)
                PressForHelpView()
                    .onTapGesture {
                        self.selectedIndex = 2
                    }
                    .tabItem {
                        Image(systemName: "cross.circle")
                        Text("Help")
                    }.tag(2)
                SearchView()
                    .onTapGesture {
                        self.selectedIndex = 3
                    }
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }.tag(3)
                SettingsView()
                    .onTapGesture {
                        self.selectedIndex = 4
                    }
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Settings")
                    }.tag(4)
            }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
