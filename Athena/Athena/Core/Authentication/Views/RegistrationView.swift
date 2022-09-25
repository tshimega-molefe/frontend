//
//  RegistrationView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/25.
//

import SwiftUI

struct RegistrationView: View {
    var body: some View {
        ZStack {
            
//            UIView Background Color
                        
            Color.theme.background
                .edgesIgnoringSafeArea(.all)
                        
//            Parent VStack
            
            VStack {
                AuthHeaderView(authImage: UIImage(imageLiteralResourceName: "register"), authLabel: "Create account with email")
                
                Spacer()
            }
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

