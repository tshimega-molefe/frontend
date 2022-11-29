//
//  SettingsTab.swift
//  Athena
//
//  Created by Dev Jacobson on 2022/11/03.
//

import SwiftUI

struct SettingsTab: View {
    let imageName: String
    let text: String
    let action: (() -> Void)
    
    var body: some View {
        Button(action: action, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 109, height: 70)
                    .foregroundColor(Color.theme.pink)
                VStack (spacing: 5) {
                    Image(systemName: imageName)
                        .font(.title2)
                        .foregroundColor(Color.theme.secondaryText)
                    Text(text)
                        .font(.custom(FontsManager.Poppins.light, size: 13))
                        .foregroundColor(Color.theme.primaryText)
                }
            }
        })
    }
}
struct SettingsTab_Previews: PreviewProvider {
    static var previews: some View {
        SettingsTab(imageName: "questionmark.circle", text: "Help") {
            print("DEBUG: Checking Settings Tab")
        }
    }
}
