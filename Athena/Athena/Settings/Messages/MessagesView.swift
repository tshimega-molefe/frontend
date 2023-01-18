//
//  MessagesView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/12/19.
//

import SwiftUI

struct MessagesView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Image(systemName: "checkmark.bubble")
                .foregroundColor(Color.theme.green)
                .font(.largeTitle)
            Text("You are all up to date")
                .foregroundColor(Color.theme.primaryText)
                .font(.custom(FontsManager.Poppins.semiBold, size: 26))
            Text("No new messages available at the moment - come back soon for new notifications")
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .foregroundColor(Color.theme.secondaryText)
                .font(.custom(FontsManager.Poppins.light, size: 16))
        }
        .navigationTitle("Messages")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
