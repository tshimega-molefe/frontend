//
//  SecondRegistration.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/26.
//

import SwiftUI

struct SecondRegistration: View {
    @EnvironmentObject var userAuth: AuthViewModel
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var cell = ""
    @State private var checked = false
    @State private var isEmptyField = false
    @State var tap = false
    @State var press = false

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
                        NumberInputField(placeholderText: "Phone number",
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
                    
                    if (self.firstName.isEmpty || self.lastName.isEmpty || self.cell.isEmpty || !self.checked)
                    {
                        IncompleteButton()

                    } else {
                        AuthButtonView(buttonLabel: "Create Account") {
                            userAuth.updateCitizen(withFirstName: firstName,
                                                lastName: lastName,
                                                cellNumber: cell)
                        }
                        .padding(.top, 40)
                    }
                    
                    

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

struct IncompleteButton: View {
    var body: some View {
        Button {
            print("DEBUG: There is missing information in either of your details fields..")
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
