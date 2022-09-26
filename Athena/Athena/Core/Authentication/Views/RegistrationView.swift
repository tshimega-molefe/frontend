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
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
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
//                        Check bool state of checked variable in logic, before enabling the user to proceed to                         the next UIView Controller
                        
                        Text("I agree to the")
                            .font(.custom(FontsManager.Poppins.regular, size: 15))
                            .foregroundColor(Color.theme.grey)

                        NavigationLink {
                            Text("Terms & Conditions")
                            
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
                        SecondRegistration()
                    } label: {
                        Text("Next")
                            .font(.custom(FontsManager.Poppins.semiBold, size: 16))
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 67)
                            .background(Color.theme.red)
                            .cornerRadius(15)

                    }
                    .shadow(color: .gray.opacity(0.3), radius: 2, x: 0, y: 0)
                    .padding(.horizontal, 30)
                    .padding(.top, 40)
                    
                    Spacer()
                    
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        HStack {
                            Text("Already have an account? ")
                                .font(.custom(FontsManager.Poppins.regular, size: 15))
                                .foregroundColor(Color.theme.grey)
                            +
                            
                            Text("Log in")
                                .font(.custom(FontsManager.Poppins.semiBold, size: 15))
                                .foregroundColor(Color.theme.accent)
                                .underline()
                        }
                    }
                }
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            }
            
        }.onTapGesture {
            dismissKeyboard()
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

