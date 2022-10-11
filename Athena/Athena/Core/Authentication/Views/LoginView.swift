//
//  LoginView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/25.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var userAuth: AuthViewModel

    @State private var isEmptyField = false
    
    //  MARK: - Properties
    
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
                                         text: $userAuth.username)
                        
                        SecureInputField(placeholderText: "Password",
                                         text: $userAuth.password)
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 64)
                    
                    //                "Forgot Password?" HStack
                    
                    HStack (alignment: .center){
                        
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
                        if(self.userAuth.username.isEmpty || self.userAuth.password.isEmpty){
                            print("DEBUG: There is missing information in either of the log in fields..")
                            self.isEmptyField = true
                                } else {
                            userAuth.loginCitizen()
                                }
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

// MARK: Lifecyle

// MARK: Extensions


