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

    @State private var isEmptyField = false
    
    var body: some View {
        VStack(alignment: .trailing){
            
            ZStack(alignment: .leading) {

               
            }
            .accentColor(Color.theme.accent)
            .padding(.leading)
            .frame(height: 67)
            .background(Color.theme.pink)
            .cornerRadius(15)
        
            
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
