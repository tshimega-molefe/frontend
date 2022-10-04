//
//  SecurityView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/26.
//

import SwiftUI

struct SecurityView: View {
    var body: some View {
        SecurityMapViewRepresentable().edgesIgnoringSafeArea(.top)
    }
}

struct SecurityView_Previews: PreviewProvider {
    static var previews: some View {
        SecurityView()
    }
}
