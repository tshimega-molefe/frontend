//
//  SettingsView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/26.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var userAuth: AuthViewModel
    
    var body: some View {
        ZStack {
            Color.theme.background.edgesIgnoringSafeArea(.top)
            
            
            AuthButtonView(buttonLabel: "Log Out") {
                userAuth.logoutCitizen()
            }

            
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
