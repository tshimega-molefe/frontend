//
//  StatusView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/26.
//

import SwiftUI

struct StatusView: View {
    var body: some View {
        AthenaMapViewRepresentable().edgesIgnoringSafeArea(.top)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        StatusView()
    }
}
