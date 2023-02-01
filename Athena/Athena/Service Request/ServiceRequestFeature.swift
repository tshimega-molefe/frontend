//
//  ServiceRequestFeature.swift
//  Athena
//
//  Created by Dev Jacobson on 2022/11/14.
//

import Foundation
import ComposableArchitecture

struct ServiceRequestFeature: ReducerProtocol {
    
    struct State: Equatable {
        var route: Route = .idle
    }
    
    enum Route: Equatable {
        case idle
        case confirmed
        case accepted
        case started
    }
    
    enum Action: Equatable {
        case confirm
        case accept
        case start
        case complete
        case updatePaymentMethod
    }
    
    var body: some ReducerProtocol<State, Action> {

        Reduce { state, action in
            switch action {
                
            case .confirm:
                state.route = .confirmed
                return .none
                
            case .accept:
                state.route = .accepted
                return .none
                
            case .start:
                state.route = .started
                return .none
                
            case .complete:
                state.route = .idle
                return .none
                
            case .updatePaymentMethod:
                return .none
                
            }
        }
        
        
    }
}
