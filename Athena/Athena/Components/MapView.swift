//
//  MapView.swift
//  Athena
//
//  Created by Dev Jacobson on 2022/11/02.
//

import SwiftUI
import MapKit

struct CustomMapView: View {
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()

    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordinate)
            }
            .edgesIgnoringSafeArea(.top)
    }

    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        CustomMapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
