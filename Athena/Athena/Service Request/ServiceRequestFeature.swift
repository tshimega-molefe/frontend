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
        // TODO: Create service provider model so data can be pulled into top block
        //var serviceProviders: [ServiceProviders] = []
        
        var route: Route = .idle
    }
    
    enum Route: Equatable {
        case idle
        case confirmed
    }
    
    enum Action: Equatable {
        case confirm
        case updatePaymentMethod
    }
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .confirm:
            state.route = .confirmed
            return .none
            
        case .updatePaymentMethod:
            return .none
        }
    }
}
