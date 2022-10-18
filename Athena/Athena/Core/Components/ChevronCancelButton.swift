//
//  ChevronCancelButton.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/10/17.
//

import SwiftUI

struct ChevronCancelButton: View {
    let cancel: (() -> Void)
    var body: some View {
        Button (action: cancel,
                
        label: {
            
            Image(systemName: "chevron.left")
                .font(.title2)
                .foregroundColor(Color.theme.accent)
        })
        .frame(maxWidth: .infinity, alignment: .leading)

    }
}

struct XCancelButton_Previews: PreviewProvider {
    static var previews: some View {
        ChevronCancelButton {
            print("DEBUG: Handle Cancel Button action..")
        }
    }
}
