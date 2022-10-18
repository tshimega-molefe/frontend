//
//  CancelButton.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/10/17.
//

import SwiftUI

struct CancelButton: View {
    let cancel: (() -> Void)
    var body: some View {
        Button(action: cancel,
               
               label: {
            
            Text("Cancel")
                .font(.custom(FontsManager.Poppins.semiBold, size: 16))
                .foregroundColor(Color.theme.accent)
                .frame(width: 100, height: 40)
                .background(Color.theme.background)
                .cornerRadius(40)
                .shadow(color: Color.theme.shadow, radius: 8)
        })
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct CancelButton_Previews: PreviewProvider {
    static var previews: some View {
        CancelButton {
            print("DEBUG: Handle cancel...")
        }
    }
}
