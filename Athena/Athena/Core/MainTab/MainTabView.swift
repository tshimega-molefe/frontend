//
//  MainTabView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/26.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    
    
    var body: some View {
        
        TabView(selection: $selectedIndex) {
            
            MapView()
                .onTapGesture {
                    self.selectedIndex = 0
                }
                .tabItem {
                    Image(systemName: "location.circle")
                }.tag(0)
            
            AresView()
                .onTapGesture {
                    self.selectedIndex = 1
                }
                .tabItem {
                    Image(systemName: "waveform.path.ecg")
                }.tag(1)
            PressForHelpView()
                .onTapGesture {
                    self.selectedIndex = 2
                }
                .tabItem {
                    Image(systemName: "cross.circle")
                    Text("Press for help")
                }.tag(2)
            DirectoryView()
                .onTapGesture {
                    self.selectedIndex = 3
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(3)
            ProfileView()
                .onTapGesture {
                    self.selectedIndex = 4
                }
                .tabItem {
                    Image(systemName: "person.crop.circle")
                }.tag(4)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
