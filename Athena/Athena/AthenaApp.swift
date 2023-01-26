//
//  AthenaApp.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/25.
//

import SwiftUI
import ComposableArchitecture

@main
struct AthenaApp: App {
    
    var body: some Scene {
        WindowGroup {
            HomeView(
                store: Store(
                    initialState: HomeFeature.State(),
                    reducer: AnyReducer(HomeFeature()),
                    environment: ()
                )
            )
        }
    }
}
