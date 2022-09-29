//
//  SettingsView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/26.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
            Color.theme.background.edgesIgnoringSafeArea(.top)
            Text("User Profile View")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
