//
//  ConfirmView.swift
//  Athena
//
//  Created by Dev Jacobson on 2022/11/04.
//

import SwiftUI
import CoreLocation
import ComposableArchitecture
import ServiceMap

struct EmergencyView: View {
    @Environment(\.presentationMode) private var presentationMode
    
    let store: Store<EmergencyFeature.State, EmergencyFeature.Action>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            
            VStack(alignment: .center) {
                
                IfLetStore(
                    self.store.scope(
                        state: \.mapFeature,
                        action: EmergencyFeature.Action.mapAction)
                ) { mapStore in
                    ServiceMapView(store: mapStore)
                    
                }
                
                
                
                IfLetStore(
                    self.store.scope(
                        state: \.serviceRequestFeature,
                        action: EmergencyFeature.Action.serviceRequestAction)
                ) { requestStore in
                    ServiceRequestView(store: requestStore)
                }
            }
            .edgesIgnoringSafeArea(.top)
            .onAppear {
                viewStore.send(.onAppear)
                viewStore.send(.connectOrDisconnect)
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(
                leading:
                    PillButton(text: "Cancel") { viewStore.send(.cancel) }
            )
            .onChange(of: viewStore.isPresented) { presented in
                if !presented {
                    self.presentationMode.wrappedValue.dismiss()
                    
                }
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


