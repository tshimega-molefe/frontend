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
                                print("DEBUG: Handle Help Tab..")
                            }
                            SettingsTab(imageName: "creditcard", text: "Wallet") {
                                print("DEBUG: Handle Wallet Tab..")
                            }
                            SettingsTab(imageName: "clock", text: "History") {
                                print("DEBUG: Handle History Tab..")
                            }
                            
                        }
                    }.padding()
                }
                
                Divider()
                    .padding(.bottom)
                    .shadow(color: Color.theme.shadow, radius: 7)
                
                ScrollView {
                    VStack (alignment: .leading, spacing: 60) {
                        
                        SettingsRow(imageName: "message", text: "Messages") {
                            print("DEBUG: Handle Messages..")
                        }
                        SettingsRow(imageName: "archivebox", text: "Evidence") {
                            print("DEBUG: Handle Evidence..")
                        }
                        SettingsRow(imageName: "gearshape", text: "Settings") {
                            print("DEBUG: Handle Settings..")
                        }
                        SettingsRow(imageName: "exclamationmark.circle", text: "Legal") {
                            print("DEBUG: Handle Legal..")
                        }
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

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
