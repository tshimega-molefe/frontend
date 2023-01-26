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
        var profile = ProfileFeature.State()
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
        case getProfileResponse(TaskResult<UserProfile>)
        case profileAction(ProfileFeature.Action)
    }
    
    @Dependency(\.userClient) private var userClient
    @Dependency(\.mainQueue) private var mainQueue
    
    var body: some ReducerProtocol<State, Action> {
        
        Scope(state: \.profile, action: /Action.profileAction) {
            ProfileFeature()
        }
        
        Reduce { state, action in
            
            switch action {
                
            case .onAppear:
                print("DEBUG: APPEARING")
                
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
                        await .getProfileResponse(TaskResult { try await userClient.getUserProfile(userToken.access) })
                    }
                }
                else {
                    //take user to login screen because no valid credentials found
                    print("DEBUG: No access token found in keychain")
                    state.authFeature = AuthenticationFeature.State()
                }
                
                return .none
                
            case let .getProfileResponse(.success(userProfile)):
                print("DEBUG: PROFILE RESPONSE \(userProfile)")
                
                state.profile.userProfile = userProfile
                if let encodedProfile = try? JSONEncoder().encode(userProfile) {
                    UserDefaults.standard.set(encodedProfile, forKey: "UserProfile")
                }
                
                return .none
                
            case let .getProfileResponse(.failure(err)):
                print("DEBUG: PROFILE FAILURE \(err)")
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
            
            case let .profileAction(.getUserProfileResponse(userProfile)):
                return .none
            
            case .profileAction(_):
                return .none
            }
        }
        .ifLet(\.authFeature, action: /Action.authAction) {
            AuthenticationFeature()
        }
    }
}
