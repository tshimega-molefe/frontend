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
                    .keyboardType(.phonePad)
                    .textInputAutocapitalization(.never)
            }
            .accentColor(Color.theme.accent)
            .padding(.leading)
            .frame(height: 67)
            .background(Color.theme.pink)
            .cornerRadius(15)
            
            if(self.isEmptyField){
                Text("Phone number is required")
                    .font(.custom(FontsManager.Poppins.semiBold, size: 15))
                    .foregroundColor(.red)
            }
        }
    }
}

struct NumberInputField_Previews: PreviewProvider {
    static var previews: some View {
        NumberInputField(placeholderText: "Phone number", text: .constant(""))
    }
}

