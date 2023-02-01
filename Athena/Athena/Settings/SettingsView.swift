//
//  SettingsView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/26.
//

import SwiftUI
import ComposableArchitecture


struct SettingsView: View {
    let store: StoreOf<SettingsFeature>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack (alignment: .leading) {
                HStack {
                    VStack (alignment: .leading, spacing: 20) {
                        
                        
                        NavigationLink {
                            EditProfileView(store: self.store)
                        } label: {
                            HStack (alignment: .center) {
                                Image("sabrina")
                                    .resizable()
                                    .frame(width: 58, height: 58)
                                    .clipShape(Circle())
                                
                                VStack (alignment: .leading, spacing: 5) {
                                    Text(viewStore.profile.userProfile.full_name)
                                        .font(.custom(FontsManager.Poppins.regular, size: 18))
                                        .foregroundColor(Color.theme.primaryText)
                                    
                                    
                                    Text("Douglasdale, Fourways")
                                        .font(.custom(FontsManager.Poppins.light, size: 14))
                                        .foregroundColor(Color.theme.secondaryText)
                                }
                            }
                        }
                        HStack (alignment: .center, spacing: 20) {
                            SettingsTab(tabType: .help)
                            SettingsTab(tabType: .wallet)
                            SettingsTab(tabType: .history)
                            
                        }
                    }.padding(.horizontal)
                }
                
                Divider()
                    .padding(.bottom)
                    .shadow(color: Color.theme.shadow, radius: 7)
                
                ScrollView {
                    VStack (alignment: .leading, spacing: 60) {
                        
                        NavigationLink {
                            MessagesView()
                        } label: {
                            SettingsRow(rowType: .messages)
                        }
                        
                        NavigationLink {
                            EvidenceView()
                        } label: {
                            SettingsRow(rowType: .evidence)
                        }
                        
                        
                        NavigationLink {
                            AccountView(store: self.store)
                        } label: {
                            SettingsRow(rowType: .account)
                        }
                        
                        NavigationLink {
                            LegalView()
                        } label: {
                            SettingsRow(rowType: .legal)
                        }
                        
                    }
                    .padding(.leading)
                }
            }
            .navigationTitle(Text("Settings"))
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(store: Store(
            initialState: SettingsFeature.State(profile: ProfileFeature.State()),
            reducer: AnyReducer(SettingsFeature()),
            environment: ()
        )
        )
    }
}
