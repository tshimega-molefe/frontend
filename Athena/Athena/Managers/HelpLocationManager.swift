//
//  HelpLocationManager.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/10/20.
//

import CoreLocation

class HelpLocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        
    }
}


extension HelpLocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard !locations.isEmpty else { return }
//        locationManager.stopUpdatingLocation()
        
    }
    
}
