//
//  SettingsRow.swift
//  Athena
//
//  Created by Dev Jacobson on 2022/11/03.
//

import SwiftUI

struct SettingsRow: View {
    
    // Account Row Types
    enum RowType {
        case messages
        case evidence
        case account
        case legal
    }
    
    let rowType: RowType
    var body: some View {
        
        switch rowType {
            
        case .messages:
                HStack (alignment: .center, spacing: 15) {
                    Image(systemName: "message")
                        .font(.title2)
                        .foregroundColor(Color.theme.secondaryText)
                    
                    Text("Messages")
                        .font(.custom(FontsManager.Poppins.regular, size: 16))
                        .foregroundColor(Color.theme.primaryText)
                    
                    Spacer()
                }
            
        case .evidence:
                HStack (alignment: .center, spacing: 15) {
                    Image(systemName: "archivebox")
                        .font(.title2)
                        .foregroundColor(Color.theme.secondaryText)
                    
                    Text("Evidence")
                        .font(.custom(FontsManager.Poppins.regular, size: 16))
                        .foregroundColor(Color.theme.primaryText)
                    
                    Spacer()
                }
            
        case .account:            
                HStack (alignment: .center, spacing: 15) {
                    Image(systemName: "gearshape")
                        .font(.title2)
                        .foregroundColor(Color.theme.secondaryText)
                    
                    Text("Account")
                        .font(.custom(FontsManager.Poppins.regular, size: 16))
                        .foregroundColor(Color.theme.primaryText)
                    
                    Spacer()
                }
            
        case .legal:
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
    }
}

struct SettingsRow_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRow(rowType: .messages)
    }
}
