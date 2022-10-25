//
//  GeneralSettingsView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/10/25.
//

import SwiftUI

struct GeneralSettingsView: View {
    
    @EnvironmentObject var userAuth: AuthViewModel
    @EnvironmentObject var wsViewModel: WebSocketViewModel
    
    var body: some View {
            List {
                Section {
                    Text("Hi")
                    Text("Hi")
                }
                
                Section {
                    Text("Home")
                } header: {
                    Text("Home Address")
                        .font(.custom(FontsManager.Poppins.light, size: 12))
                        .textCase(.none)
                }
                
                Section {
                    Text("Family")
                } header: {
                    Text("Family")
                        .font(.custom(FontsManager.Poppins.light, size: 12))
                        .textCase(.none)
                }
                
                Section {
                    Text("Privacy")
                }
                
                Section {
                    Text("Notifications")
                }
                
                Section {
                    Text("Account Management")
                }
                
                Button {
                    userAuth.logoutCitizen()
                    wsViewModel.closeService()
                } label: {
                    Text("Sign Out")
                        .font(.custom(FontsManager.Poppins.medium, size: 14))
                        .foregroundColor(Color.theme.accent)
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton()
                }
            }
        .navigationBarBackButtonHidden(true)
    }
}

struct GeneralSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralSettingsView()
    }
}
