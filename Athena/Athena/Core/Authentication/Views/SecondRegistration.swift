//
//  SecondRegistration.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/26.
//

import SwiftUI

struct SecondRegistration: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var cell = ""
    @State private var checked = false

    var body: some View {
            ZStack {
                
                //            UIView Background Color
                
                Color.theme.background
                    .edgesIgnoringSafeArea(.all)
                
                //            Parent VStack
                
                VStack {
                    AuthHeaderView(authImage: UIImage(imageLiteralResourceName: "register"), authLabel: "Your details")
                    
                    //                Authentication TextField VStack
                    
                    
                    VStack (spacing: 10) {
                        CustomInputField(placeholderText: "First name",
                                         text: $firstName)
                        CustomInputField(placeholderText: "Last name",
                                         text: $lastName)
                        CustomInputField(placeholderText: "Phone number",
                                         text: $cell)
                    }
                    .padding(.horizontal, 30)
                    
                    HStack (alignment: .center) {
                        CheckBoxView(checked: $checked)
//                        Check bool state of checked variable in logic, before enabling the user to proceed to the next UIView Controller
                        
                        Text("I have read the")
                            .font(.custom(FontsManager.Poppins.regular, size: 15))
                            .foregroundColor(Color.theme.grey)
                        
                        NavigationLink {
                            Text("Privacy Policy")
                            
                        } label: {
                            Text("Privacy Policy")
                                .font(.custom(FontsManager.Poppins.semiBold, size: 15))
                                .foregroundColor(Color.theme.accent)
                                .underline()
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 30)
                    .padding(.top)

                    
                    AuthButtonView(buttonLabel: "Create Account") {
                        print("DEBUG: Handle create account..")
                    }.padding(.top, 40)
                    
                    Spacer()
            
                }
            }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onTapGesture {
            dismissKeyboard()
        }
    }
}

struct SecondRegistration_Previews: PreviewProvider {
    static var previews: some View {
        SecondRegistration()
    }
}
