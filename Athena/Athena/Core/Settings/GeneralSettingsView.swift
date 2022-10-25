//
//  GeneralSettingsView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/10/25.
//

import SwiftUI

struct GeneralSettingsView: View {
    var body: some View {
            List {
                Section {
                    Text("Hi")
                    Text("Hi")
                } header: {
                    Text("Header")
                }

            }
            .listStyle(.automatic)
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton()
                }
            }
        .navigationBarBackButtonHidden(true)
    }
}

struct GeneralSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralSettingsView()
    }
}
