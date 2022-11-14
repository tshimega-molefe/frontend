//
//  SettingsRow.swift
//  Athena
//
//  Created by Dev Jacobson on 2022/11/03.
//

import SwiftUI

struct SettingsRow: View {
    let imageName: String
    let text: String
    let action: (() -> Void)
    
    var body: some View {
        Button(action: action, label: {
                HStack (spacing: 15) {
                    Image(systemName: imageName)
                        .font(.title2)
                        .foregroundColor(Color.theme.secondaryText)
                    Text(text)
                        .font(.custom(FontsManager.Poppins.regular, size: 16))
                        .foregroundColor(Color.theme.primaryText)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
        })
    }
}

struct SettingsRow_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRow(imageName: "message", text: "Messages") {
            print("")
        }
    }
}
