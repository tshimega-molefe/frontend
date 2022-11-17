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
                MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011286, longitude: -116.166868))
                
                IfLetStore(
                    self.store.scope(
                        state: \.serviceRequestFeature,
                        action: EmergencyFeature.Action.serviceRequestAction)
                ) { requestStore in
                    ServiceRequestView(store: requestStore)
                }
            }
            .onAppear {
                viewStore.send(.connectOrDisconnect)
                viewStore.send(.onAppear)
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(
                leading:
                    PillButton(text: "Cancel") { viewStore.send(.cancel) }
            )
            .onChange(of: viewStore.isPresented) { presented in
                if !presented { self.presentationMode.wrappedValue.dismiss() }
            }
            .onDisappear {
                viewStore.send(.connectOrDisconnect)
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


