//
//  RegistrationView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/25.
//

import SwiftUI

struct RegistrationView: View {
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            
//            UIView Background Color
                        
            Color.theme.background
                .edgesIgnoringSafeArea(.all)
                        
//            Parent VStack
            
            VStack {
                AuthHeaderView(authImage: UIImage(imageLiteralResourceName: "register"), authLabel: "Create account")
                
                //                Authentication TextField VStack
                
                
                VStack (spacing: 10) {
                    CustomInputField(placeholderText: "Username",
                                     text: $username)
                    CustomInputField(placeholderText: "Email",
                                     text: $email)
                    CustomInputField(placeholderText: "Password",
                                     text: $password)
                }
                .padding(.horizontal, 30)
                
                AuthButtonView(buttonLabel: "Next", action: {
                    print("DEBUG: Handle create account..")
                })
                    .padding(.top, 30)
                
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

