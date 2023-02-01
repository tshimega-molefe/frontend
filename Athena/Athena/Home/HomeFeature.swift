//
//  HomeFeature.swift
//  Athena
//
//  Created by Dev Jacobson on 2023/01/23.
//

import Foundation
import ComposableArchitecture
import ServiceMap

struct HomeFeature: ReducerProtocol {
    
    struct State: Equatable {
        @BindableState var route: Route = .emergency
        var authFeature: AuthenticationFeature.State?
        var profile: ProfileFeature.State = ProfileFeature.State()
        
        var settings: SettingsFeature.State {
            get {
                SettingsFeature.State(profile: profile)
            }
            set {
                self.profile = newValue.profile
            }
        }
        var emergency = EmergencyFeature.State()
    }
    
    enum Route: Equatable {
        case status
        case security
        case emergency
        case search
        case settings
    }
    
    
    enum Action: BindableAction, Equatable {
        case onAppear
        case binding(BindingAction<State>)
        case authAction(AuthenticationFeature.Action)
        case profile(ProfileFeature.Action)
        case settings(SettingsFeature.Action)
        case emergency(EmergencyFeature.Action)
        case serviceMap(MapFeature.Action)
        case serviceRequest(ServiceRequestFeature.Action)
    }
    
    @Dependency(\.userClient) private var userClient
    @Dependency(\.mainQueue) private var mainQueue
    
    var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        
        Scope(state: \.settings, action: /Action.settings) {
            SettingsFeature()
        }
        
        Scope(state: \.emergency, action: /Action.emergency) {
            EmergencyFeature()
        }
        
        Scope(state: \.profile, action: /Action.profile) {
            ProfileFeature()
        }
        
        
        Reduce { state, action in
            
            switch action {
                
            case .onAppear:
                if let tokenData = KeychainHelper.standard.read(service: "user-token"){
                    print("DEBUG: Current access token is \(String(describing: tokenData))")
                    
                    //convert the token representation back into a swift struct
                    let userToken = try! JSONDecoder().decode(UserToken.self, from: tokenData)
                    print("DEBUG: Current access token is \(String(describing: userToken.access))")
                    
                    //take user to main screen because they have valid access token
                    //TODO: check if access token has passed expiry
                    //TODO: should probably do a post to server to check that the credentials are valid
                    state.authFeature = nil
                    
                    return .task {
                        return .profile(.getUserProfile(userToken))
                    }
                }
                else {
                    //take user to login screen because no valid credentials found
                    print("DEBUG: No access token found in keychain")
                    state.authFeature = AuthenticationFeature.State()
                }
                
                return .none
                
            case .binding:
                return .none
                
            case .authAction(.loginResponse(.success)):
                state.authFeature = nil
                return .none
                
            case .authAction(.registerResponse(.success)):
                state.authFeature = nil
                return .none
                
            case .authAction:
                return .none
            case .settings:
                return .none
            case .profile:
                return .none
            case .emergency:
                return .none
            case .serviceMap:
                return .none
            case .serviceRequest:
                return .none
            }
        }
        .ifLet(\.authFeature, action: /Action.authAction) {
            AuthenticationFeature()
        }
    }
}
