//
//  SecurityView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/26.
//

import SwiftUI

struct SecurityView: View {
    var body: some View {
        ZStack {
            Color.theme.background.edgesIgnoringSafeArea(.all)
            Text("Security Services")
        }
    }
}

struct SecurityView_Previews: PreviewProvider {
    static var previews: some View {
        SecurityView()
    }
}
