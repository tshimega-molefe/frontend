//
//  StatusView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/26.
//

import SwiftUI

struct StatusView: View {
    var body: some View {
        StatusMapViewRepresentable().edgesIgnoringSafeArea(.top)
    }
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        StatusView()
    }
}
