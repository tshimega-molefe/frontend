//
//  AccountView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/12/12.
//

import SwiftUI
import ComposableArchitecture

struct AccountView: View {
    @ObservedObject var viewStore: ViewStore<AccountFeature.State, AccountFeature.Action>
    let store: Store<AccountFeature.State, AccountFeature.Action>
    
    init(store: Store<AccountFeature.State, AccountFeature.Action>) {
        self.store = store
        self.viewStore = ViewStore(self.store)
    }
    
    var body: some View {
                
            List {
                // Edit Profile Section
                Section {
                    NavigationLink {
                        EditProfileView(store: Store(initialState: EditProfileFeature.State(userProfile: viewStore.userProfile),
                                                     reducer: AnyReducer(EditProfileFeature()),
                                                     environment: ()))
                    } label: {
                        HStack (alignment: .center) {
                            
                            Image("sabrina")
                                .resizable()
                                .frame(width: 58, height: 58)
                                .clipShape(Circle())
                            
                            VStack (alignment: .leading) {
                                
                                Text(viewStore.userProfile?.user.first_name ?? "User Legal Name")
                                    .font(.custom(FontsManager.Poppins.light, size: 14))
                                    .foregroundColor(Color.theme.secondaryText)
                                
                                if viewStore.userProfile?.contact_number == "" {
                                    Text("+27 82 888 9999")
                                        .font(.custom(FontsManager.Poppins.light, size: 14))
                                        .foregroundColor(Color.theme.secondaryText)
                                }
                                else {
                                    Text(viewStore.userProfile?.contact_number ?? "+27 82 888 9999")
                                        .font(.custom(FontsManager.Poppins.light, size: 14))
                                        .foregroundColor(Color.theme.secondaryText)
                                }
                                
                                
                                    
                                
                                Text(viewStore.userProfile?.user.email ?? "test@gmail.com")
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

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(store: Store(initialState: AccountFeature.State(),
                          reducer: AnyReducer(AccountFeature()),
                         environment: ()))
    }
}
