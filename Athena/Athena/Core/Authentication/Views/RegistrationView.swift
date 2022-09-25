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
    @State private var checked = false
    
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
                
                HStack (alignment: .center) {
                    CheckBoxView(checked: $checked)
                    
                    Text("I agree to the")
                        .font(.custom(FontsManager.Poppins.regular, size: 15))
                        .foregroundColor(Color.theme.grey)
                    
                    
                    NavigationLink {
                        Text("Terms and Conditions")
                        
                    } label: {
                        Text("Terms & Conditions")
                            .font(.custom(FontsManager.Poppins.semiBold, size: 15))
                            .foregroundColor(Color.theme.accent)
                            .underline()
                    }
                    Spacer()
                }
                .padding(.horizontal, 30)
                .padding(.top)
                
                NavigationLink {
                    Text("RegistrationViewTwo")
                } label: {
                    Text("Next")
                        .font(.custom(FontsManager.Poppins.semiBold, size: 16))
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 67)
                        .background(Color.theme.red)
                        .cornerRadius(15)
                }
                .padding(.horizontal, 30)
                .padding(.top, 35)
                
                Spacer()
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

