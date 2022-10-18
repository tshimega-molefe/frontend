//
//  SecurityBackgroundView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/10/17.
//

import SwiftUI

struct SecurityBackgroundView: View {
    var body: some View {
        VStack {
            Text("How can we help?")
                .foregroundColor(Color.theme.accent)
                .font(.custom(FontsManager.Poppins.semiBold, size: 20))
                .padding(.bottom, 280)
                .padding(.top, 22)
            
        }
        .frame(width: UIScreen.main.bounds.width)
        .background(Color.theme.background)
        .cornerRadius(24)
    }
}

struct SecurityBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        SecurityBackgroundView()
    }
}
