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
        var profile: ProfileFeature.State
    }

    enum Action: BindableAction, Equatable {
        case onAppear
        case binding(BindingAction<State>)
        case profile(ProfileFeature.Action)
    }
    
    var body: some ReducerProtocol<State, Action> {
        
        BindingReducer()

        Scope(state: \.profile, action: /Action.profile) {
            ProfileFeature()
        }
        
        Reduce { state, action in
            
            switch action {
                
            case .onAppear:
                return .none

            case .binding:
                return .none
                
            case .profile:
                return .none
                
            }
        }
    }
}
