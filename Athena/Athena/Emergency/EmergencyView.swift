//
//  ConfirmView.swift
//  Athena
//
//  Created by Dev Jacobson on 2022/11/04.
//

import SwiftUI
import CoreLocation
import ComposableArchitecture

struct EmergencyView: View {
    @Environment(\.dismiss) var dismiss
    
    var cancelButton: some View {
        PillButton(text: "Cancel") {
            dismiss()
        }
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011286,
                                                       longitude: -116.166868))
            
            //Note: This is where we going to see TCA in action
            //      because we can use the functions (state, action etc.) from the child composable view
            ServiceRequestView(store: Store(initialState: ServiceRequestFeature.State(),
                                            reducer: AnyReducer(ServiceRequestFeature()),
                                            environment: ()))
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: cancelButton)
    }
}

struct EmergencyView_Previews: PreviewProvider {
    static var previews: some View {
        EmergencyView()
    }
}


