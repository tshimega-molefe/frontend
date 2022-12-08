//
//  SettingsTab.swift
//  Athena
//
//  Created by Dev Jacobson on 2022/11/03.
//

import SwiftUI

struct SettingsTab: View {
    
    
    
    enum TabType {
        case help
        case wallet
        case history
    }
    
    let tabType: TabType
    let action: (() -> Void)
    
    var body: some View {
        
        switch tabType {
            
        case .help:
            Button(action: action, label: {
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
            })
            
        case .wallet:
            Button(action: action, label: {
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
            })
            
        case .history:
            Button(action: action, label: {
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
            })
        }
    }
}
struct SettingsTab_Previews: PreviewProvider {
    static var previews: some View {
        SettingsTab(tabType: .history) {
            print("DEBUG: Checking Settings Tab")
        }
    }
}
