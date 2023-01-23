//
//  AccountView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/12/12.
//

import SwiftUI
import ComposableArchitecture

struct AccountView: View {
        
    let store: Store<AccountFeature.State, AccountFeature.Action>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            
            List {
                // Edit Profile Section
                Section {
                    NavigationLink {
                        EditProfileView(store: Store(initialState: EditProfileFeature.State(),
                                                     reducer: AnyReducer(EditProfileFeature()),
                                                     environment: ()))
                    } label: {
                        HStack (alignment: .center) {
                            
                            Image("sabrina")
                                .resizable()
                                .frame(width: 58, height: 58)
                                .clipShape(Circle())
                            
                            VStack (alignment: .leading) {
                                
                                Text("Sabrina Morreno")
                                    .font(.custom(FontsManager.Poppins.light, size: 14))
                                    .foregroundColor(Color.theme.secondaryText)
                                
                                Text("+27 84 758 6250")
                                    .font(.custom(FontsManager.Poppins.light, size: 14))
                                    .foregroundColor(Color.theme.secondaryText)
                                
                                Text("sabrinamo*****@gmail.com")
                                    .font(.custom(FontsManager.Poppins.light, size: 14))
                                    .foregroundColor(Color.theme.secondaryText)
                            }
                            
                        }
                    }
                    
                    NavigationLink {
                        FamilyView()
                    } label: {
                        Text("Family")
                            .font(.custom(FontsManager.Poppins.medium, size: 14))
                            .foregroundColor(Color.theme.primaryText)
                    }
                    
                    
                }
                // Home Address Section
                Section {
                    NavigationLink {
                        Text("Home Address Page")
                    } label: {
                        Text("Home")
                            .font(.custom(FontsManager.Poppins.medium, size: 14))
                            .foregroundColor(Color.theme.primaryText)
                    }
                    
                } header: {
                    Text("Home Address")
                        .font(.custom(FontsManager.Poppins.light, size: 12))
                        .foregroundColor(Color.theme.primaryText)
                        .textCase(.none)
                }
                
                // Privacy Section
                Section {
                    NavigationLink {
                        Text("Privacy Policy Page")
                    } label: {
                        VStack (alignment: .leading) {
                            Text("Privacy")
                                .font(.custom(FontsManager.Poppins.medium, size: 14))
                                .foregroundColor(Color.theme.primaryText)
                            
                            Text("Manage the data you share with us")
                                .font(.custom(FontsManager.Poppins.light, size: 12))
                                .foregroundColor(Color.theme.secondaryText)
                        }
                    }
                }
                
                // Notifications Section
                Section {
                    NavigationLink {
                        NotificationsView()
                    } label: {
                        Text("Notifications")
                            .font(.custom(FontsManager.Poppins.medium, size: 14))
                            .foregroundColor(Color.theme.primaryText)
                    }
                }
                
                // Account Management Section
                Section {
                    NavigationLink {
                        Text("Account Management Page")
                    } label: {
                        Text("Account Management")
                            .font(.custom(FontsManager.Poppins.medium, size: 14))
                            .foregroundColor(Color.theme.primaryText)
                    }
                }
                
                // SignOut Section
                Section {
                    Button {
                        //userAuth.logoutCitizen()
                    } label: {
                        Text("Sign Out")
                            .font(.custom(FontsManager.Poppins.medium, size: 14))
                            .foregroundColor(Color.theme.red)
                    }
                }
                
                
                
            }
            .navigationBarTitleDisplayMode(.large)
            .listStyle(.automatic)
            .navigationTitle("Account")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(store: Store(initialState: AccountFeature.State(),
                          reducer: AnyReducer(AccountFeature()),
                         environment: ()))
    }
}
