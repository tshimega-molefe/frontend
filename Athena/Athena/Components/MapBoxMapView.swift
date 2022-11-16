//
//  MapBoxMapView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/11/16.
//

import SwiftUI
import MapboxMaps

struct MapBoxMapView: UIViewControllerRepresentable {
    
     
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
       let myResourceOptions = ResourceOptions(accessToken: "sk.eyJ1IjoidHNoaW1lZ2EiLCJhIjoiY2xham9qdXY0MDA5dzNxbXZvYnhweHp3eCJ9.AACTDu0VM5PEhfhpejujwA")
       let cameraOptions = CameraOptions(center: CLLocationCoordinate2D(latitude: 40.83647410051574, longitude: 14.30582273457794), zoom: 10, bearing: -17.6, pitch: 45)
       
       let myMapInitOptions = MapInitOptions(resourceOptions: myResourceOptions, cameraOptions: cameraOptions, styleURI: StyleURI(rawValue: "mapbox://styles/tshimega/clajmjpb9001q14ntt9p6t1wt"))

       mapView = MapView(frame: view.bounds, mapInitOptions: myMapInitOptions)
       mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
       self.view.addSubview(mapView)
   }
}

