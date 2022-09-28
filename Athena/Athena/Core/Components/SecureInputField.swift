//
//  SecureInputField.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/28.
//

import SwiftUI

struct SecureInputField: View {
    let placeholderText: String
    @Binding var text: String
    @StateObject var userAuth = AuthViewModel()
    @State private var isEmptyField = false
    
    var body: some View {
        VStack(alignment: .trailing){
            
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    Text(placeholderText)
                        .font(.custom(FontsManager.Poppins.light, size: 15))
                        .foregroundColor(Color.theme.grey)
                }
                SecureField("", text: $text)
                    .font(.custom(FontsManager.Poppins.regular, size: 15))
                    .foregroundColor(Color.theme.primaryText)
                    .textInputAutocapitalization(.never)
            }
            .accentColor(Color.theme.accent)
            .padding(.leading)
            .frame(height: 67)
            .background(Color.theme.pink)
            .cornerRadius(15)
            
//            if(!self.userAuth.isCorrect){
//                Text("Password is incorrect")
//                    .font(.custom(FontsManager.Poppins.semiBold, size: 15))
//                    .foregroundColor(.red)
//            }
            
            if(self.isEmptyField){
                Text("Password is required")
                    .font(.custom(FontsManager.Poppins.semiBold, size: 15))
                    .foregroundColor(.red)
            }
            
        }
    }
}

struct SecureInputField_Previews: PreviewProvider {
    static var previews: some View {
        SecureInputField(placeholderText: "Password", text: .constant(""))
    }
}
