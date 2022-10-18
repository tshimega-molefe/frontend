//
//  ServiceButtonView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/10/17.
//

import SwiftUI

struct EscortButtonView: View {
    let clicked: (() -> Void)
    var body: some View {
        Button(action: clicked) {
            HStack {
                ZStack {
                    Circle()
                        .fill(Color.theme.button)
                        .frame(width: 50, height: 50)
                        .shadow(color: Color.theme.shadow, radius: 6)
                    
                    Image(systemName: "house")
                        .foregroundColor(Color.theme.primaryText)
                }
                .padding(12)
                
                Text("Security Escort")
                    .foregroundColor(Color.theme.primaryText)
                    .font(.custom(FontsManager.Poppins.medium, size: 18))
                    
                
                Spacer()
            }
        }
        .padding(.leading, 8)
        
    }
}

struct ServiceButtonView_Previews: PreviewProvider {
    static var previews: some View {
        EscortButtonView {
            print("DEBUG: Handle Service Button Clicked...")
        }
    }
}
