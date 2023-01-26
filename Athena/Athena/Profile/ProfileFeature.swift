//
//  ProfileFeature.swift
//  Athena
//
//  Created by Dev Jacobson on 2023/01/25.
//

import Foundation
import ComposableArchitecture

struct ProfileFeature: ReducerProtocol {
    
    
    struct State: Equatable {
        //TODO: Should probably never be optional
        var userProfile: UserProfile?
    }
    
    enum Action: Equatable {
        case getUserProfile
        case getUserProfileResponse(TaskResult<UserProfile>)
    }
    
    var body: some ReducerProtocol<State, Action>{
        Reduce { state, action in
            
            switch action {
                
            case .getUserProfile:
                return .none
            
            case let .getUserProfileResponse(userProfile):
                return .none
                
            }
        }
    }
}
