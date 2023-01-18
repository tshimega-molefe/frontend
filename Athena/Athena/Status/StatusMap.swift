//
//  StatusMap.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/26.
//

import SwiftUI
import MapboxMaps

struct StatusMap: UIViewControllerRepresentable {
 
    func makeUIViewController(context: Context) -> MapViewController {
        return MapViewController()
    }
    
    func updateUIViewController(_ uiViewController: MapViewController, context: Context) {
    }
}

class MapViewController: UIViewController {
    internal var mapView: MapView!
    override public func viewDidLoad() {
        super.viewDidLoad()
        let myResourceOptions = ResourceOptions(accessToken:
            "sk.eyJ1IjoidHNoaW1lZ2EiLCJhIjoiY2xham9qdXY0MDA5dzNxbXZvYnhweHp3eCJ9.AACTDu0VM5PEhfhpejujwA")
        
        let myMapInitOptions = MapInitOptions(resourceOptions: myResourceOptions,
                                              styleURI: StyleURI(rawValue: "mapbox://styles/tshimega/clajmjpb9001q14ntt9p6t1wt"))
        
        mapView = MapView(frame: view.bounds, mapInitOptions: myMapInitOptions)
        mapView.ornaments.options.scaleBar.visibility = .hidden
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(mapView)
        
        // User Point Annotations
        
//        var pointAnnotation = PointAnnotation(coordinate: CLLocationCoordinate2DMake(latitude: -33.901829726, longitude: 18.420331652))
        
        
        
        
        mapView.location.delegate = self
        mapView.location.options.activityType = .other
        mapView.location.options.puckType = .puck2D()
        mapView.location.locationProvider.startUpdatingLocation()
        
        mapView.mapboxMap.onNext(event: .mapLoaded) { [self]_ in
            self.locationUpdate(newLocation: mapView.location.latestLocation!)
        }
    }
}

extension MapViewController: LocationPermissionsDelegate, LocationConsumer {
    
    func locationUpdate(newLocation: Location) {
        mapView.camera.fly(to: CameraOptions(center: newLocation.coordinate, zoom: 6, pitch: 68), duration: 4.0)
    }
}
