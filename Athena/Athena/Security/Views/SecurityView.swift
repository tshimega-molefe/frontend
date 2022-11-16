//
//  SecurityView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/26.
//

import SwiftUI
import MapKit

struct SecurityView: View {
    @ObservedObject var locationService: LocationSearchService
    
    @State private var selectedService: SecurityServiceCard.SelectedService? = .noInput
    @State private var mapState = SecurityMapViewState.noInput
    
    let coordinate = CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868)
    
    var body: some View {
        
        if selectedService == .noInput {
            VStack {
                MapBoxMapView()
                SecurityServiceCard(selectedService: $selectedService)
            }
            .edgesIgnoringSafeArea(.top)
            
        }
        else if selectedService == .escort || selectedService == .vip {
            if #available(iOS 16.0, *) {
                VStack (alignment: .leading){
                    LocationSearchView(locationService: locationService)
                }
                .toolbar(.hidden, for: .tabBar)
            } else {
                // Fallback on earlier versions
            }
        }
        
    }
}

struct SecurityView_Previews: PreviewProvider {
    static var previews: some View {
        SecurityView(locationService: LocationSearchService())
    }
}
