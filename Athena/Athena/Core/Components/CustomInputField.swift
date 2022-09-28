//
//  CustomInputField.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/25.
//

import SwiftUI

struct CustomInputField: View {
    let placeholderText: String
    @Binding var text: String
//    @StateObject var userAuth = AuthViewModel()
    @State private var isEmptyField = false
    
    var body: some View {
        VStack {
            
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    Text(placeholderText)
                        .font(.custom(FontsManager.Poppins.light, size: 15))
                        .foregroundColor(Color.theme.grey)
                }
                TextField("", text: $text)
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
//                Text("Email or Username is incorrect")
//                    .font(.custom(FontsManager.Poppins.semiBold, size: 15))
//                    .foregroundColor(.red)
//            }
            
            if(self.isEmptyField){
                Text("Email or Username is required")
                    .font(.custom(FontsManager.Poppins.semiBold, size: 15))
                    .foregroundColor(.red)
            }
        }
    }
}

struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(placeholderText: "Email", text: .constant(""))
    }
}
