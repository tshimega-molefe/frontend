//
//  CustomInputField.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/25.
//

import SwiftUI

struct CustomInputField: View {
    
    enum InputType {
        case text
        case email
        case number
        case secure
    }
    
    let inputType: InputType
    let placeholderText: String
    
    @Binding var text: String
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                switch(inputType) {
                case .text:
                    TextField(placeholderText, text: $text)
                case .email:
                    TextField(placeholderText, text: $text).keyboardType(.emailAddress)
                case .secure:
                    SecureField(placeholderText, text: $text).privacySensitive()
                case .number:
                    TextField(placeholderText, text: $text).keyboardType(.phonePad)
                }
            }
            .font(.custom(FontsManager.Poppins.regular, size: 15))
            .foregroundColor(Color.theme.primaryText)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            .accentColor(Color.theme.accent)
            .padding(.leading)
            .frame(height: 67)
            .background(Color.theme.pink)
            .cornerRadius(15)
        }
    }
}

struct CustomInputField_Previews: PreviewProvider {
    
    static var previews: some View {
        
        CustomInputField(inputType: CustomInputField.InputType.text, placeholderText: "Email", text: .constant(""))
    }
}
