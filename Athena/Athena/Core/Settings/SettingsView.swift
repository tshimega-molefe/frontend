//
//  SettingsView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/26.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var userAuth: AuthViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.theme.background.edgesIgnoringSafeArea(.top)
                
                List {
    
                    Section {
                        VStack (alignment: .leading, spacing: 20) {
                            ProfileTab()
                            
                            HStack (alignment: .center, spacing: 20) {
                                HelpTab()
                                WalletTab()
                                HistoryTab()
                                
                            }
                        }.padding()
                    }
                    
                    Section {
                        VStack (alignment: .leading, spacing: 40) {
                            EvidenceTab()
                            MessagesTab()
                            SettingsTab()
                            LegalTab()
                        }
                    } header: {
                        Text("Tools")
                    }

  
                }
                .listStyle(.grouped)
                .navigationTitle("Your Account")
                .navigationBarTitleDisplayMode(.large)
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

struct HelpTab: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 109, height: 70)
                .foregroundColor(Color.theme.lightGrey)
            VStack (spacing: 5) {
                Image(systemName: "questionmark.circle")
                    .font(.title2)
                    .foregroundColor(Color.theme.secondaryText)
                Text("Help")
                    .font(.custom(FontsManager.Poppins.light, size: 13))
            }
        }
    }
}

struct WalletTab: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 109, height: 70)
                .foregroundColor(Color.theme.lightGrey)
            VStack (spacing: 5) {
                Image(systemName: "creditcard")
                    .font(.title2)
                    .foregroundColor(Color.theme.secondaryText)
                Text("Wallet")
                    .font(.custom(FontsManager.Poppins.light, size: 13))
            }
        }
    }
}

struct HistoryTab: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 109, height: 70)
                .foregroundColor(Color.theme.lightGrey)
            VStack (spacing: 5) {
                Image(systemName: "clock")
                    .font(.title2)
                    .foregroundColor(Color.theme.secondaryText)
                Text("History")
                    .font(.custom(FontsManager.Poppins.light, size: 13))
            }
        }
    }
}


struct ProfileTab: View {
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
        HStack (alignment: .center, spacing: 15) {
            Image(systemName: "tray.fill")
                .font(.title2)
                .foregroundColor(Color.theme.secondaryText)
            
            Text("Your Evidence")
        }
        .padding(.top, 5)
        .padding(.bottom, 25)
    }
}
struct MessagesTab: View {
    var body: some View {
        HStack (alignment: .center, spacing: 15) {
            Image(systemName: "message")
                .font(.title2)
                .foregroundColor(Color.theme.secondaryText)
            
            Text("Messages")
        }
        .padding(.top, 5)
        .padding(.bottom, 25)
    }
}
struct SettingsTab: View {
    var body: some View {
        HStack (alignment: .center, spacing: 15) {
            Image(systemName: "gearshape")
                .font(.title2)
                .foregroundColor(Color.theme.secondaryText)
            
            Text("Settings")
        }
        .padding(.top, 5)
        .padding(.bottom, 25)
    }
}
struct LegalTab: View {
    var body: some View {
        HStack (alignment: .center, spacing: 15) {
            Image(systemName: "exclamationmark.circle")
                .font(.title2)
                .foregroundColor(Color.theme.secondaryText)
            
            Text("Legal")
        }
        .padding(.top, 10)
        .padding(.bottom, 20)
    }
}
