//
//  EmergencyFeature.swift
//  Athena
//
//  Created by Dev Jacobson on 2022/11/13.
//

import ComposableArchitecture

struct EmergencyFeature: ReducerProtocol {
    
    struct State: Equatable {
        var route: Route = .confirming
    }
    
    enum Route: Equatable {
        case confirming
        case requested
        case accepted
    }
    
    enum Action: Equatable {
        case onAppear
        case cancel
    }
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .onAppear:
            
            return .none
            
        case .cancel:
            return .none
        }
    }
}
