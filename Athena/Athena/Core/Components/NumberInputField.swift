//
//  NumberInputField.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/28.
//

import SwiftUI

struct NumberInputField: View {
    let placeholderText: String
    @Binding var text: String
    
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
                    .keyboardType(.numberPad)
                    .textInputAutocapitalization(.never)
            }
            .accentColor(Color.theme.accent)
            .padding(.leading)
            .frame(height: 67)
            .background(Color.theme.pink)
            .cornerRadius(15)
        }
    }
}

struct NumberInputField_Previews: PreviewProvider {
    static var previews: some View {
        NumberInputField(placeholderText: "Phone number", text: .constant(""))
    }
}

