//
//  LocationManager.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/10/04.
//

import CoreLocation

class StatusLocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        
    }
}


extension StatusLocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard !locations.isEmpty else { return }
        print(locations.first)
        locationManager.stopUpdatingLocation()
        
    }
    
}
