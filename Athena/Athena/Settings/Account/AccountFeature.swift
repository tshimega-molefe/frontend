//
//  AccountFeature.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/12/12.
//

import Foundation
import SwiftUI
import ComposableArchitecture

struct AccountFeature: ReducerProtocol {
        
    struct State: Equatable {
        var route: Route = .idle
        var userProfile: UserProfile?
    }
    
    enum Route: Equatable {
        case idle
    }
    
    enum Action: Equatable {
        case openAccountManagement
        case updateNotificationSettings
        case openPrivacySettings
        case updateFamily
        case setHomeAddress
        case updateAccount
        case signOut
        case dismissView
    }
    
    var body: some ReducerProtocol<State, Action>{
        
        Reduce { state, action in
            
            switch action {
                
            case .updateAccount:
                return .none
                
            case .setHomeAddress:
                return .none
                
            case .updateFamily:
                return .none
                
            case .openPrivacySettings:
                return .none
                
            case .updateNotificationSettings:
                return .none
                
            case .openAccountManagement:
                return .none
                
            case .signOut:
                print("DEBUG: Handle Sign Out User")
                return .none
                
            case .dismissView:
                return .none
            }
            
        }
    }
}
