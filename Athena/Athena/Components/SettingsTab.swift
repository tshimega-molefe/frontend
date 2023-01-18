//
//  SettingsTab.swift
//  Athena
//
//  Created by Dev Jacobson on 2022/11/03.
//

import SwiftUI
import ComposableArchitecture

struct SettingsTab: View {
    @State private var showingSheet = false

    enum TabType {
        case help
        case wallet
        case history
    }
    
    let tabType: TabType
    
    var body: some View {
        
        switch tabType {
            
        case .help:
            Button {
                showingSheet.toggle()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 109, height: 70)
                        .foregroundColor(Color.theme.pink)
                    VStack (spacing: 5) {
                        Image(systemName: "questionmark.circle")
                            .font(.title2)
                            .foregroundColor(Color.theme.secondaryText)
                        Text("Help")
                            .font(.custom(FontsManager.Poppins.light, size: 13))
                            .foregroundColor(Color.theme.primaryText)
                    }
                }
            }
            .sheet(isPresented: $showingSheet) {
                HelpView()
            }


            
            
            
                
            
        case .wallet:
            Button {
                showingSheet.toggle()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 109, height: 70)
                        .foregroundColor(Color.theme.pink)
                    VStack (spacing: 5) {
                        Image(systemName: "creditcard")
                            .font(.title2)
                            .foregroundColor(Color.theme.secondaryText)
                        Text("Wallet")
                            .font(.custom(FontsManager.Poppins.light, size: 13))
                            .foregroundColor(Color.theme.primaryText)
                    }
                }
            }
            .sheet(isPresented: $showingSheet) {
                WalletView()
            }
            
        case .history:
                Button {
                    showingSheet.toggle()
                } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 109, height: 70)
                        .foregroundColor(Color.theme.pink)
                    VStack (spacing: 5) {
                        Image(systemName: "clock")
                            .font(.title2)
                            .foregroundColor(Color.theme.secondaryText)
                        Text("History")
                            .font(.custom(FontsManager.Poppins.light, size: 13))
                            .foregroundColor(Color.theme.primaryText)
                    }
                }
                }
                .sheet(isPresented: $showingSheet) {
                    HistoryView()
                }
        }
    }
}
struct SettingsTab_Previews: PreviewProvider {
    static var previews: some View {
        SettingsTab(tabType: .history)
    }
}
