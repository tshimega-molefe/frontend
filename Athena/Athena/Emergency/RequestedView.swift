//
//  RequestedView.swift
//  Athena
//
//  Created by Dev Jacobson on 2022/11/05.
//

import SwiftUI

struct RequestedView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var cancelButton: some View {
        PillButton(text: "Cancel") {
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    var body: some View {
        Text("Requested View!")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: cancelButton)
    }
}

struct RequestedView_Previews: PreviewProvider {
    static var previews: some View {
        RequestedView()
    }
}
