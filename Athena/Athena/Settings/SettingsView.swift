//
//  SettingsView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/26.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var showHelpView: Bool = false
    @State private var showWalletView: Bool = false
    @State private var showHistoryView: Bool = false
    
    var body: some View {
        
            VStack (alignment: .leading) {
                HStack {
                    VStack (alignment: .leading, spacing: 20) {
                        ProfileTab()
                        
                        HStack (alignment: .center, spacing: 20) {
                            SettingsTab(imageName: "questionmark.circle", text: "Help") {
                                print("DEBUG: Help tab clicked in Settings")
                            }
                            SettingsTab(imageName: "creditcard", text: "Wallet") {
                                print("DEBUG: Wallet tab clicked in Settings")
                            }
                            SettingsTab(imageName: "clock", text: "History") {
                                print("DEBUG: History tab clicked in Settings")
                            }
                            
                        }
                    }.padding()
                }
                
                Divider()
                    .padding(.bottom)
                    .shadow(color: Color.theme.shadow, radius: 7)
                
                ScrollView {
                    VStack (alignment: .leading, spacing: 60) {
                        
                        MessagesTab()
                        EvidenceTab()
                        //SettingsTab()
                        LegalTab()
                    }
                }
            }
    }
}

struct ProfileTab: View {
    @EnvironmentObject var userAuth: AuthViewModel
    
    var body: some View {
        HStack (alignment: .top) {
            Image("sabrina")
                .resizable()
                .frame(width: 58, height: 58)
                .clipShape(Circle())
            
            VStack (alignment: .leading) {
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

struct EvidenceTab: View {
    var body: some View {
        
        NavigationLink {
            EvidenceView()
        } label: {
            HStack (alignment: .center, spacing: 15) {
                Image(systemName: "archivebox")
                    .font(.title2)
                    .foregroundColor(Color.theme.secondaryText)
                
                Text("Evidence")
                    .font(.custom(FontsManager.Poppins.regular, size: 16))
                    .foregroundColor(Color.theme.primaryText)
                
                Spacer()
            }
        }
        .padding(.horizontal)
        .padding(.top, 10)
        
    }
}
struct MessagesTab: View {
    var body: some View {
        NavigationLink {
            MessagesView()
        } label: {
            HStack (alignment: .center, spacing: 15) {
                Image(systemName: "message")
                    .font(.title2)
                    .foregroundColor(Color.theme.secondaryText)
                
                Text("Messages")
                    .font(.custom(FontsManager.Poppins.regular, size: 16))
                    .foregroundColor(Color.theme.primaryText)
                
                Spacer()
            }
        }
        .padding(.horizontal)
        .padding(.top, 10)
    }
}
//struct SettingsTab: View {
//    var body: some View {
//        
//        NavigationLink {
//            GeneralSettingsView()
//        } label: {
//            HStack (alignment: .center, spacing: 15) {
//                Image(systemName: "gearshape")
//                    .font(.title2)
//                    .foregroundColor(Color.theme.secondaryText)
//                
//                Text("Settings")
//                    .font(.custom(FontsManager.Poppins.regular, size: 16))
//                    .foregroundColor(Color.theme.primaryText)
//                
//                Spacer()
//            }
//        }
//        .padding(.horizontal)
//        .padding(.top, 10)
//    }
//}
struct LegalTab: View {
    var body: some View {
        
        NavigationLink {
            LegalView()
        } label: {
            HStack (alignment: .center, spacing: 15) {
                Image(systemName: "exclamationmark.circle")
                    .font(.title2)
                    .foregroundColor(Color.theme.secondaryText)
                
                Text("Legal")
                    .font(.custom(FontsManager.Poppins.regular, size: 16))
                    .foregroundColor(Color.theme.primaryText)
                
                Spacer()
            }
        }
        .padding(.horizontal)
        .padding(.top, 10)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
