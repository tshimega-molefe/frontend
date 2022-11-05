//
//  ServiceButtonView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/10/17.
//

import SwiftUI

struct SecurityCardRow: View {
    let text: String
    let imageName: String
    let clicked: (() -> Void)
    var body: some View {
        Button(action: clicked) {
            HStack {
                ZStack {
                    Circle()
                        .fill(Color.theme.button)
                        .frame(width: 50, height: 50)
                        .shadow(color: Color.theme.shadow, radius: 6)
                    
                    Image(systemName: imageName)
                        .foregroundColor(Color.theme.primaryText)
                }
                .padding(12)
                
                Text(text)
                    .foregroundColor(Color.theme.primaryText)
                    .font(.custom(FontsManager.Poppins.medium, size: 18))
                
                Spacer()
            }
        }
        .padding(.leading, 8)
        
    }
}

struct SecurityCardRow_Previews: PreviewProvider {
    static var previews: some View {
        SecurityCardRow(text: "Security Escort", imageName: "house") {
            print("DEBUG: Handle Service Button Clicked...")
        }
    }
}
