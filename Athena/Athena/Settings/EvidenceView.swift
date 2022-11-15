//
//  EvidenceView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/10/25.
//

import SwiftUI

struct EvidenceView: View {
    @Environment(\.presentationMode) private var presentationMode

    var body: some View {
        CancelButton(imageName: "xmark", font: .callout) {
            self.presentationMode.wrappedValue.dismiss()
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct EvidenceView_Previews: PreviewProvider {
    static var previews: some View {
        EvidenceView()
    }
}
