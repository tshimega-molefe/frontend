//
//  SettingsView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/26.
//

import SwiftUI
import ComposableArchitecture


struct SettingsView: View {
    @Environment(\.presentationMode) private var presentationMode
    
    let store: Store<SettingsFeature.State, SettingsFeature.Action>

    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack (alignment: .leading) {
                               HStack {
                                   VStack (alignment: .leading, spacing: 20) {
                                       
                                       
                                       NavigationLink {
                                           AccountView(store: Store(initialState: AccountFeature.State(),
                                                                    reducer: AnyReducer(AccountFeature()),
                                                                   environment: ()))
                                       } label: {
                                           ProfileTab()
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
                                       AccountView(store: Store(initialState: AccountFeature.State(),
                                                                reducer: AnyReducer(AccountFeature()),
                                                               environment: ()))
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
        }
    }
}


struct ProfileTab: View {
    var body: some View {
        HStack (alignment: .center) {
            Image("sabrina")
                .resizable()
                .frame(width: 58, height: 58)
                .clipShape(Circle())
            
            VStack (alignment: .leading, spacing: 5) {
                Text("Sabrina Morreno")
                    .font(.custom(FontsManager.Poppins.regular, size: 18))
                    .foregroundColor(Color.theme.primaryText)
                
                
                Text("Douglasdale, Fourways")
                    .font(.custom(FontsManager.Poppins.light, size: 14))
                    .foregroundColor(Color.theme.secondaryText)
            }
        }
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(store: Store(initialState: SettingsFeature.State(),
                                  reducer: AnyReducer(SettingsFeature()),
                                 environment: ()))
    }
}
