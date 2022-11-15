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
    @Environment(\.presentationMode) private var presentationMode
    
    let store: Store<EmergencyFeature.State, EmergencyFeature.Action>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            ZStack(alignment: .bottom) {
                MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011286,
                                                           longitude: -116.166868))
                
                //Note: This is where we going to see TCA in action
                //      because we can use the functions (state, action etc.) from the child composable view
                IfLetStore(
                    self.store.scope(
                    state: \.serviceRequestFeature,
                    action: EmergencyFeature.Action.serviceRequestAction)
                ) { requestStore in
                    ServiceRequestView(store: requestStore)
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                                    PillButton(text: "Cancel") {
                self.presentationMode.wrappedValue.dismiss()
                viewStore.send(.cancel)
            })
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
}

struct EmergencyView_Previews: PreviewProvider {
    static var previews: some View {
        EmergencyView(store: Store(
            initialState: EmergencyFeature.State(),
            reducer: AnyReducer(EmergencyFeature()),
            environment: ()))
    }
}


