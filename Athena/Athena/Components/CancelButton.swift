//
//  CancelButton.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/10/17.
//

import SwiftUI

struct CancelButton: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    let imageName: String
    let font: Font

    
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
                    Image(systemName: imageName)
                        .font(font)
                        .foregroundColor(Color.theme.accent)
                })
    }
}

struct CancelButton_Previews: PreviewProvider {
    static var previews: some View {
        CancelButton(imageName: "chevron.left", font: .title3)
    }
}
