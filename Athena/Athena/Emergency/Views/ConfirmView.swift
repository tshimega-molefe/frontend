//
//  ConfirmView.swift
//  Athena
//
//  Created by Dev Jacobson on 2022/11/04.
//

import SwiftUI

struct ConfirmView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var mapState = HelpMapViewState.notPressed
    @Binding var state: Emergency.Status?
    
    var cancelButton: some View {
        PillButton(text: "Cancel") {
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    var body: some View {
        VStack {
            HelpMapViewRepresentable(helpMapState: $mapState).edgesIgnoringSafeArea(.top)
            ServiceRequestView(state: $state)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: cancelButton)
    }
}

struct ConfirmView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmView( state: .constant(.idle))
    }
}


