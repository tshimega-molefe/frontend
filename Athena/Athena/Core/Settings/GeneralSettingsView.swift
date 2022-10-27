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
                }
                
                Section {
                    Text("Home")
                        .font(.custom(FontsManager.Poppins.medium, size: 14))
                        .foregroundColor(Color.theme.primaryText)
                } header: {
                    Text("Home Address")
                        .font(.custom(FontsManager.Poppins.light, size: 12))
                        .textCase(.none)
                }
                
                Section {
                    Text("Family")
                        .font(.custom(FontsManager.Poppins.medium, size: 14))
                        .foregroundColor(Color.theme.primaryText)
                } header: {
                    Text("Family")
                        .font(.custom(FontsManager.Poppins.light, size: 12))
                        .textCase(.none)
                }
                
                Section {
                    VStack(alignment: .leading) {
                        Text("Privacy")
                            .font(.custom(FontsManager.Poppins.medium, size: 14))
                            .foregroundColor(Color.theme.primaryText)
                        Text("Manage the data you share with us")
                            .font(.custom(FontsManager.Poppins.light, size: 12))
                            .foregroundColor(Color.theme.secondaryText)
                    }
                }
                
                Section {
                    Text("Notifications")
                        .font(.custom(FontsManager.Poppins.medium, size: 14))
                        .foregroundColor(Color.theme.primaryText)
                }
                
                Section {
                    Text("Account Management")
                        .font(.custom(FontsManager.Poppins.medium, size: 14))
                        .foregroundColor(Color.theme.primaryText)
                }
                
                Section {
                    Text("Sign Out")
                        .font(.custom(FontsManager.Poppins.medium, size: 14))
                        .foregroundColor(Color.theme.accent)
                }
                .onTapGesture {
                    userAuth.logoutCitizen()
                    wsViewModel.closeService()
                    print("DEBUG: Logged out current user \(userAuth.username)")
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
