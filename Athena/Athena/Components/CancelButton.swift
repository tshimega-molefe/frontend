//
//  CancelButton.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/10/17.
//

import SwiftUI

struct CancelButton: View {
    let imageName: String
    let font: Font
    let cancel: (() -> Void)
    
    var body: some View {
        Button (action: cancel,
                label: {
                    Image(systemName: imageName)
                        .font(font)
                        .foregroundColor(Color.theme.accent)
                })
    }
}

struct CancelButton_Previews: PreviewProvider {
    static var previews: some View {
        CancelButton(imageName: "chevron.left", font: .title2) {
            print("DEBUG: Handle Cancel Button action..")
        }
    }
}
