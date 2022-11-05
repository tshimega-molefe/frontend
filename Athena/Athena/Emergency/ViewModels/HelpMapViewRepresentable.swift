//
//  HelpMapViewRepresentable.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/10/27.
//

import SwiftUI
import MapKit

struct HelpMapViewRepresentable: UIViewRepresentable {

    let mapView = MKMapView()
    @Binding var helpMapState: HelpMapViewState
    
    func makeUIView(context: Context) -> some UIView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = true
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .followWithHeading
        
        
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        print("DEBUG: Map State is \(helpMapState)")
        
        switch helpMapState {
        case .notPressed:
            context.coordinator.clearMapViewAndRecenterOnUserLocation()
            break
        case .pressed:
            break
        case .confirmed:
            break
        case .accepted:
            break
        case .arrived:
            break
        case .completed:
            break
        }
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
}

extension HelpMapViewRepresentable {
    
    class MapCoordinator: NSObject, MKMapViewDelegate {
        
        // MARK: - Properties
        
        let parent: HelpMapViewRepresentable
        var userLocationCoordinate: CLLocationCoordinate2D?
        var currentRegion: MKCoordinateRegion?
        
        // MARK: - Lifecycle
        
        init(parent: HelpMapViewRepresentable) {
            self.parent = parent
            super.init()
        }
        
        // MARK: - MKMapViewDelegate
        
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            self.userLocationCoordinate = userLocation.coordinate
            let region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
                ,span: MKCoordinateSpan(latitudeDelta: 0.008, longitudeDelta: 0.008)
            )
            
            
            
            self.currentRegion = region
        
            parent.mapView.setRegion(region, animated: true)
        }
        
        // MARK: - Helper Functions
        
        func clearMapViewAndRecenterOnUserLocation() {
            parent.mapView.removeAnnotations(parent.mapView.annotations)
            parent.mapView.removeOverlays(parent.mapView.overlays)
            
            if let currentRegion = currentRegion {
                parent.mapView.setRegion(currentRegion, animated: true)
            }
        }
    }
}

