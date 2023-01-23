//
//  SettingsFeature.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/11/29.
//

import Foundation
import SwiftUI
import ComposableArchitecture

struct SettingsFeature: ReducerProtocol {
    
    
    struct State: Equatable {
        var route: Route = .idle
        var isPresented = true
    }
    
    enum Route: Equatable {
        case idle
    }
    
    enum Action: Equatable {
        case onAppear
        case accountAction(AccountFeature.Action)
    }
    
    var body: some ReducerProtocol<State, Action>{
        Reduce { state, action in
            
            switch action {
                
            case .onAppear:
                state.isPresented = true
                return .none
                
            case .accountAction(.signOut):
                //userAuth.logoutCitizen()
                return .none
                
            case .accountAction(_):
                return .none

            }
        }
    }
}
