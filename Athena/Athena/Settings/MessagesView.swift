//
//  MessagesView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/10/25.
//

import SwiftUI

struct MessagesView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        CancelButton(imageName: "xmark", font: .callout) {
            dismiss()
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
