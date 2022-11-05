//
//  PressForHelpButton.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/10/27.
//

import SwiftUI

struct EmergencyButton: View {
    //let clickHelp: (() -> Void)
    
    var body: some View {
        
        ZStack {
            PinkRing()
                .shadow(color: Color.theme.red.opacity(0.40), radius: 50)
            RedRing()
            HelpText()
        }
    }
}

extension EmergencyButton {
    struct HelpText: View {
        var body: some View {
            
            HStack {
                Text("Press ")
                    .font(.custom(FontsManager.Poppins.extraBold, size: 24))
                    .foregroundColor(Color.theme.primaryText)
                +
                Text("for help")
                    .font(.custom(FontsManager.Poppins.regular, size: 24))
                    .foregroundColor(Color.theme.primaryText)
            }
            .frame(width: 248, height: 248)
            .background(Color.theme.button)
            .clipShape(Circle())
        }
    }

    struct RedRing: View {
        var body: some View {
            Circle()
                .stroke(Color.theme.red, lineWidth: 2)
                .frame(width: 250, height: 250)
            
        }
    }

    struct PinkRing: View {
        var body: some View {
            Circle()
                .stroke(Color.theme.pinkRing, lineWidth: 30)
                .frame(width: 270, height: 270)
        }
    }

}

struct PressForHelpButton_Previews: PreviewProvider {
    static var previews: some View {
        EmergencyButton()
    }
}
