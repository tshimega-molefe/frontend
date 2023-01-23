//
//  HomeFeature.swift
//  Athena
//
//  Created by Dev Jacobson on 2023/01/23.
//

import Foundation
import ComposableArchitecture

struct HomeFeature: ReducerProtocol {
    
    struct State: Equatable {
        var route: Route = .emergency
        var authFeature: AuthenticationFeature.State?
    }
    
    enum Route: Equatable {
        case status
        case security
        case emergency
        case search
        case settings
    }
    
    enum Action: Equatable {
        case onAppear
        case authAction(AuthenticationFeature.Action)
    }
    
    @Dependency(\.mainQueue) private var mainQueue
    
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
                        
            switch action {
                
            case .onAppear:
                print("DEBUG: APPEARING")
                
                if let data = KeychainHelper.standard.read(service: "user-token"){
                    let accessToken = String(data: data, encoding: .utf8)
                    print("DEBUG: Current access token is \(String(describing: accessToken))")
                    
                    //take user to main screen because they have valid access token
                    //TODO: check if access token has passed expiry
                    //TODO: should probably do a post to server to check that the credentials are valid
                    state.authFeature = nil
                }
                else {
                    //take user to login screen because no valid credentials found
                    print("DEBUG: No access token found in keychain")
                    state.authFeature = AuthenticationFeature.State()
                }
                
                return .none
            
                
            /*
             --------------
              auth actions
             --------------
             */
            case .authAction(.loginResponse(.success(_))):
                state.authFeature = nil
                return .none
                
            case .authAction(.registerResponse(.success(_))):
                state.authFeature = nil
                return .none
                
            case .authAction(_):
                return .none
            }
        }
        .ifLet(\.authFeature, action: /Action.authAction) {
            AuthenticationFeature()
        }
    }
}

