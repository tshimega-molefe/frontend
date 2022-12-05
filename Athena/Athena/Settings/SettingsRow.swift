//
//  SettingsRow.swift
//  Athena
//
//  Created by Dev Jacobson on 2022/11/03.
//

import SwiftUI

struct SettingsRow: View {
    
    enum RowType {
        case messages
        case evidence
        case settings
        case legal
    }
    
    let rowType: RowType
    let action: (() -> Void)
    
    
    var body: some View {
        
        switch rowType {
        case .messages:
            Button(action: action) {
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
            
        case .evidence:
            Button(action: action) {
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
            
        case .settings:
            Button(action: action) {
                HStack (alignment: .center, spacing: 15) {
                    Image(systemName: "gearshape")
                        .font(.title2)
                        .foregroundColor(Color.theme.secondaryText)
                    
                    Text("Settings")
                        .font(.custom(FontsManager.Poppins.regular, size: 16))
                        .foregroundColor(Color.theme.primaryText)
                    
                    Spacer()
                }
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
        case .legal:
            Button(action: action) {
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
}

struct SettingsRow_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRow(rowType: .messages) {
            print("DEBUG: Handle opening the messages view..")
        }
    }
}
