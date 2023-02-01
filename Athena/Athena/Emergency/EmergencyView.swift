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
    let store: StoreOf<EmergencyFeature>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            
            
            VStack(alignment: .center) {
                ServiceMapView(store: store.scope(state: \.map, action: EmergencyFeature.Action.map))
                ServiceRequestView(store: store.scope(state: \.serviceRequest, action: EmergencyFeature.Action.serviceRequest))
            }
            .edgesIgnoringSafeArea(.top)
                .onAppear {
                    viewStore.send(.connectOrDisconnect)
                }
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(
                    leading:
                        PillButton(text: "Cancel") {
                            if(viewStore.shouldDismiss){
//                                viewStore.send(.connectOrDisconnect)
                                presentationMode.wrappedValue.dismiss()
                            }
                            
                            viewStore.send(.cancel)
                        }
                )
        }
    }
}
