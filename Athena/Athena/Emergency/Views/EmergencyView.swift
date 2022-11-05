//
//  PressForHelpView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/26.
//

import SwiftUI
import CoreLocation

struct EmergencyView: View {
    
    @Binding var emergencyStatus: Emergency.Status?
    
    let coordinate = CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868)
    var body: some View {
        VStack {
            NavigationLink(destination: ConfirmView(state: $emergencyStatus),
                           tag: Emergency.Status.confirming, selection: $emergencyStatus) {
                EmergencyButton()
            }
            
            NavigationLink(destination: RequestedView(),
                           tag: Emergency.Status.requested, selection: $emergencyStatus) {
                EmptyView()
            }
        }
    }
}



struct PressForHelpView_Previews: PreviewProvider {
    static var previews: some View {
        EmergencyView(emergencyStatus: .constant(.confirming))
    }
}

