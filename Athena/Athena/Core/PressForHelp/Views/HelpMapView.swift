//
//  HelpMapView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/10/20.
//

import SwiftUI

struct HelpMapView: View {
    @State private var mapState = HelpMapViewState.notPressed
    
    var body: some View {
        HelpMapViewRepresentable(mapState: $mapState).edgesIgnoringSafeArea(.top)
    }
}

struct HelpMapView_Previews: PreviewProvider {
    static var previews: some View {
        HelpMapView()
    }
}
