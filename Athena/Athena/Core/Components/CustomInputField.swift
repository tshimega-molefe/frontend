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
                    .autocorrectionDisabled()
            }
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
        CustomInputField(placeholderText: "Email", text: .constant(""))
    }
}
