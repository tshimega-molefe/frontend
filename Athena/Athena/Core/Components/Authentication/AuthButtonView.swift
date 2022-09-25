//
//  AuthButtonView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/25.
//

import SwiftUI

    



struct AuthButtonView: View {
    let buttonLabel: String
    let action: (() -> Void)
    var body: some View {
        HStack {
            Button(action: action) {
                Text(buttonLabel)
                    .font(.custom(FontsManager.Poppins.semiBold, size: 16))
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 67)
                    .background(Color.theme.red)
                    .cornerRadius(15)
            }
            .shadow(color: .gray.opacity(0.5), radius: 8, x: 0, y: 0)
        }
        .padding(.horizontal, 30)
    }
}

struct AuthButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AuthButtonView(buttonLabel: "Next") {
            print("")
        }
    }
}
