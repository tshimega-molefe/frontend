//
//  LoginView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/25.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var checked = false
    
    var body: some View {
            ZStack {
                
                Color.theme.background.edgesIgnoringSafeArea(.all)
                
                //            Parent VStack
                
                VStack {
                    
                    //            AuthHeaderView
                    
                    AuthHeaderView(authImage: UIImage(imageLiteralResourceName: "login"), authLabel: "Log In")
                    
                    //                Authentication TextField VStack
                    
                    VStack (spacing: 10) {
                        CustomInputField(placeholderText: "Username",
                                         text: $email)
                        
                        CustomInputField(placeholderText: "Password",
                                         text: $password)
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 64)
                    
                    //                "Forgot Password?" HStack
                    
                    HStack (alignment: .center){
                        
                        CheckBoxView(checked: $checked)

                        Text("Remember Me")
                            .font(.custom(FontsManager.Poppins.regular, size: 15))
                            .foregroundColor(Color.theme.grey)
                        
                        Spacer()
                        
                        NavigationLink {
                            Text("Reset Password")
                        } label: {
                            Text("Forgot Password?")
                                .font(.custom(FontsManager.Poppins.regular, size: 15))
                                .foregroundColor(Color.theme.accent)
                            
                        }
                    }
                    .padding(.horizontal, 30)
                    .padding(.top)
                    
                    //                    Log In Button
                    
                    AuthButtonView(buttonLabel: "Log In") {
                        print("DEBUG: Handle log in..")
                    }
                    .padding(.top, 40)
                    
                    
                    Spacer()
                    
                    //                    Don't have an account button
                    
                    NavigationLink {
                        RegistrationView()
                    } label: {
                        HStack {
                            Text("Don't have an account? ")
                                .font(.custom(FontsManager.Poppins.regular, size: 15))
                                .foregroundColor(Color.theme.grey)
                            
                            +
                            
                            Text("Sign Up")
                                .font(.custom(FontsManager.Poppins.semiBold, size: 15))
                                .foregroundColor(Color.theme.accent)
                                .underline()
                        }
                    }
                }
            }
            .navigationTitle("Log In")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onTapGesture {
                dismissKeyboard()
            }
        }
    }

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
