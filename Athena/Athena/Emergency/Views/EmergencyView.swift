//
//  PressForHelpView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/26.
//

import SwiftUI
import CoreLocation

struct EmergencyView: View {
    
    @StateObject private var emergency: Emergency = Emergency()


    let coordinate = CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868)
    var body: some View {
        NavigationLink(destination: ConfirmView(),
                       tag: Emergency.EmergencyState.confirm, selection: $emergency.emergencyState) {
            EmergencyButton()
        }
    }
}



struct PressForHelpView_Previews: PreviewProvider {
    static var previews: some View {
        EmergencyView()
    }
}

