//
//  RegistrationView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/25.
//

import SwiftUI

struct RegistrationView: View {
    @EnvironmentObject var userAuth: AuthViewModel
    
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var checked = false
    @State private var isEmptyField = false
    @State var tap = false
    @State var press = false
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
            ZStack {
                
                //            UIView Background Color
                
                Color.theme.background
                    .edgesIgnoringSafeArea(.all)
                
                //            Parent VStack
                
                VStack {
                    AuthHeaderView(authImage: UIImage(imageLiteralResourceName: "register"), authLabel: "Create Account")
                    
                    //                Authentication TextField VStack
                    
                    
                    VStack (spacing: 10) {
                        CustomInputField(placeholderText: "Username",
                                         text: $username)
                        CustomInputField(placeholderText: "Email",
                                         text: $email)
                        .keyboardType(.emailAddress)
                        SecureInputField(placeholderText: "Password",
                                         text: $password)
                    }
                    .padding(.horizontal, 30)
                    
                    HStack (alignment: .center) {
                        CheckBoxView(checked: $checked)
                        
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

                    if (self.username.isEmpty || self.email.isEmpty || self.password.isEmpty || !self.checked) {
                        IncompleteFormButton()
                    } else {
                        NavigationLink(destination: SecondRegistration().onAppear {
                            
                            userAuth.registerCitizen(withUsername: username, email: email, password: password)
                            
                        })
                        {
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
                    }
                    
                    Spacer()
                    
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        HStack {
                            Text("Already have an account? ")
                                .font(.custom(FontsManager.Poppins.regular, size: 15))
                                .foregroundColor(Color.theme.grey)
                            +
                            
                            Text("Log In")
                                .font(.custom(FontsManager.Poppins.semiBold, size: 15))
                                .foregroundColor(Color.theme.accent)
                                .underline()
                        }
                    }
                }
                
            }
            .navigationTitle("Create Account")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onTapGesture {
            dismissKeyboard()
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

struct IncompleteFormButton: View {
    var body: some View {
        Button {
            print("DEBUG: There is missing information in either of the create account fields..")
        } label: {
            Text("Incomplete Form")
                .font(.custom(FontsManager.Poppins.semiBold, size: 16))
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 67)
                .background(Color.theme.red)
                .cornerRadius(15)
        }
        
        .shadow(color: .gray.opacity(0.3), radius: 2, x: 0, y: 0)
        .padding(.horizontal, 30)
        .padding(.top, 40)
    }
    
}
