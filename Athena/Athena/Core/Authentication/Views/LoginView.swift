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
    
    var body: some View {
        
        ZStack {
            
//            UIView Background Color
            
            Color.theme.background
                .edgesIgnoringSafeArea(.all)
            
//            Parent VStack
            
            VStack {
                
    //            Authentication Header VStack
                
                VStack(alignment: .center) {
                    
                    Image("login")
                        .padding(/*@START_MENU_TOKEN@*/.top, 10.0/*@END_MENU_TOKEN@*/)
                        
                    
                    Text("Log In")
                        .font(.custom(FontsManager.Poppins.black, size: 36))
                        .fontWeight(.semibold)
                        .foregroundColor(Color("SecondaryTextColor"))
                        .padding(.top, -2.0)
                }
                
//                Authentication TextField VStack
                
                VStack (spacing: 10) {
                    CustomInputField(placeholderText: "Enter your email",
                                     text: $email)
                    
                    CustomInputField(placeholderText: "Enter your password",
                                     text: $password)
                }
                .padding(.horizontal, 30)
                .padding(.top, 64)
                
//                "Forgot Password?" HStack
                
                HStack {
                    Spacer()
                    
                    NavigationLink {
                        Text("Reset Password")
                    } label: {
                        Text("Forgot Password?")
                            .font(.custom(FontsManager.Poppins.regular, size: 15))
                            .foregroundColor(Color.theme.accent)
                            .padding(.top)
                            .padding(.trailing, 30)
                    }
                }
                
                Button {
                    print("DEBUG: Handle log In here..")
                }
            label: {
                    Text("Log In")
                        .font(.custom(FontsManager.Poppins.semiBold, size: 16))
                        .foregroundColor(.white)
                        .frame(width: 330, height: 67)
                        .background(Color.theme.red)
                        .cornerRadius(15)
                }
                .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 0)
                

                
                Spacer()
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarHidden(true)
                } label: {
                    Text("Don't have an account?")
                        .font(.custom(FontsManager.Poppins.regular, size: 15))
                        .foregroundColor(Color.theme.grey)
                    
                    Text("Sign Up")
                        .font(.custom(FontsManager.Poppins.semiBold, size: 15))
                        .foregroundColor(Color.theme.accent)
                        .underline()
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
