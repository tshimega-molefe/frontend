//
//  SecurityMapViewRepresentable.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/10/04.
//

import SwiftUI
import MapKit

struct SecurityMapViewRepresentable: UIViewRepresentable {

    let mapView = MKMapView()
    let SecLocationManager = SecurityLocationManager()
    
    func makeUIView(context: Context) -> some UIView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
}

extension SecurityMapViewRepresentable {
    
    class MapCoordinator: NSObject, MKMapViewDelegate {
        let parent: SecurityMapViewRepresentable
        
        init(parent: SecurityMapViewRepresentable) {
            self.parent = parent
            super.init()
        }
        
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            let region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
                ,span: MKCoordinateSpan(latitudeDelta: 0.025, longitudeDelta: 0.025)
            )
            
            
        
            parent.mapView.setRegion(region, animated: true)
        }
        
    }
    
}

