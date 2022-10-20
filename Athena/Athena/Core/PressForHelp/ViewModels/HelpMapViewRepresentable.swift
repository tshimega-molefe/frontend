//
//  HelpMapViewRepresentable.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/10/20.
//

import SwiftUI
import MapKit

struct HelpMapViewRepresentable: UIViewRepresentable {
    
    let mapView = MKMapView()
    let PressHelpLocationManager = HelpLocationManager()
    @Binding var mapState: HelpMapViewState
    
    func makeUIView(context: Context) -> some UIView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = true
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .followWithHeading
        
        
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
}

extension HelpMapViewRepresentable {
    
    class MapCoordinator: NSObject, MKMapViewDelegate {
        let parent: HelpMapViewRepresentable
        
        init(parent: HelpMapViewRepresentable) {
            self.parent = parent
            super.init()
        }
        
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            let region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
                ,span: MKCoordinateSpan(latitudeDelta: 0.0025, longitudeDelta: 0.0025)
            )
            

            parent.mapView.setRegion(region, animated: true)
        }
        
    }
    
}
