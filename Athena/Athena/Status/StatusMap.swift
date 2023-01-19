//
//  StatusMap.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/26.
//

import SwiftUI
import MapboxMaps
import CoreLocation

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
        
//         User Point Annotations
        
        
        var pointAnnotation3 = PointAnnotation(coordinate: CLLocationCoordinate2DMake(51.5072, 0.1276))
        var pointAnnotation2 = PointAnnotation(coordinate: CLLocationCoordinate2DMake(-26.2041, 28.0473))
        var pointAnnotation = PointAnnotation(coordinate: CLLocationCoordinate2DMake(-33.901829726, 18.420331652))
        pointAnnotation.image = .init(image: UIImage(named: "Timmy")!, name: "Timmy")
        pointAnnotation2.image = .init(image: UIImage(named: "Mommy")!, name: "Mommy")
        pointAnnotation3.image = .init(image: UIImage(named: "Sister")!, name: "Sister")
        pointAnnotation.iconSize = 0.32
        pointAnnotation2.iconSize = 0.32
        pointAnnotation3.iconSize = 0.32
        pointAnnotation.iconAnchor = .bottom
        pointAnnotation2.iconAnchor = .bottom
        pointAnnotation3.iconAnchor = .bottom
        
        
        let pointAnnotationManager = mapView.annotations.makePointAnnotationManager()
        pointAnnotationManager.annotations = [pointAnnotation, pointAnnotation2, pointAnnotation3]
        
        pointAnnotationManager.delegate = self
        
        
        
        mapView.location.delegate = self
        mapView.location.options.activityType = .other
        mapView.location.options.puckType = .puck2D()
        mapView.location.locationProvider.startUpdatingLocation()
        
        mapView.mapboxMap.onNext(event: .mapLoaded) { [self]_ in
            self.locationUpdate(newLocation: mapView.location.latestLocation!)
        }
    }
}

extension MapViewController: LocationPermissionsDelegate, LocationConsumer, AnnotationInteractionDelegate {
    
    func locationUpdate(newLocation: Location) {
        mapView.camera.fly(to: CameraOptions(center: newLocation.coordinate, zoom: 2, bearing: 0, pitch: 45), duration: 2.75)
    }
    
    public func annotationManager(_ manager: AnnotationManager, didDetectTappedAnnotations annotations: [Annotation]) {
        print("Annotations tapped: \(annotations)")
//        self.addViewAnnotation(at: CLLocationCoordinate2DMake(-33.901829726, 18.420331652))
    }
    
    private func createSampleView(withText text: String) -> UIView {
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.textColor = .black
        label.backgroundColor = .white
        label.textAlignment = .center
        return label
    }
    
    private func addViewAnnotation(at coordinate: CLLocationCoordinate2D) {
        let options = ViewAnnotationOptions(
        geometry: Point(coordinate),
        width: 80,
        height: 35,
        allowOverlap: false,
        visible: true,
        anchor: .bottomLeft,
        offsetX: 40)
        
        let sampleView = createSampleView(withText: "Tshimega")
        try? mapView.viewAnnotations.add(sampleView, options: options)
    }
}
