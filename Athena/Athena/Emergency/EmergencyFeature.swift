//
//  EmergencyFeature.swift
//  Athena
//
//  Created by Dev Jacobson on 2022/11/13.
//

import ComposableArchitecture

struct EmergencyFeature: ReducerProtocol {
    
    struct State: Equatable {
        var serviceRequestFeature: ServiceRequestFeature.State?
        var route: Route = .confirming
    }
    
    enum Route: Equatable {
        case confirming
        case requested
        case accepted
    }
    
    enum Action: Equatable {
        case serviceRequestAction(ServiceRequestFeature.Action)
        case onAppear
        case cancel
    }
    
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                state.serviceRequestFeature = ServiceRequestFeature.State()
                return .none
            case .cancel:
                //state.serviceRequestFeature = nil
                return .none
            case .serviceRequestAction:
                return .none
            }
        }
        .ifLet(\.serviceRequestFeature, action: /Action.serviceRequestAction) {
            ServiceRequestFeature()
        }
        
        
    }
}
