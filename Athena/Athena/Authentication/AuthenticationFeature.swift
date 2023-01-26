//
//  AuthenticationFeature.swift
//  Athena
//
//  Created by Dev Jacobson on 2023/01/23.
//

import Foundation
import ComposableArchitecture

struct AuthenticationFeature: ReducerProtocol {
    
    struct State: Equatable {
        var username = ""
        var email = ""
        var password = ""
        
        var tcAccepted = false
        var route: Route = .login
    }
    
    enum Route: Equatable {
        case login
        case register
    }
    
    enum Action: Equatable {
        case onAppear
        case toggleType
        case usernameChanged(String)
        case passwordChanged(String)
        case emailChanged(String)
        case tcCheckboxToggle
        case loginButtonTapped
        case loginResponse(TaskResult<UserToken>)
        case registerButtonTapped
        case registerResponse(TaskResult<UserToken>)
    }
    
    @Dependency(\.userClient) private var userClient
    @Dependency(\.mainQueue) private var mainQueue
    
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            
            switch action {
                
            case .onAppear:
                
                return .none
                
            case .toggleType:
                
                if state.route == .login {
                    state.route = .register
                }
                else if state.route == .register {
                    state.route = .login
                }
                
                state.username = ""
                state.email = ""
                state.password = ""
                
                return .none
                
            case let .usernameChanged(username):
                state.username = username
                
                print("DEBUG username change: \(state.username)")
                return .none
                
            case let .emailChanged(email):
                print("DEBUG email change: \(state.email)")
                state.email = email
                return .none
                
            case let .passwordChanged(password):
                print("DEBUG password change: \(state.password)")
                state.password = password
                return .none
                
            case .tcCheckboxToggle:
                state.tcAccepted.toggle()
                return .none
                
            case .loginButtonTapped:
                return .task { [username = state.username, password = state.password] in
                    await .loginResponse(TaskResult { try await userClient.login(username, password) })
                }
                
                
            case let .loginResponse(.success(userToken)):
                print("DEBUG: LOGIN RESPONSE \(userToken)")
                //encode the struct into json so it can be saved as data in the keychain
                guard let jsonToken = try? JSONEncoder().encode(userToken) else {
                    return .none
                }
                
                KeychainHelper.standard.save(jsonToken, service: "user-token")
                
                return .none
                
                //Handle the failure for registration here so an alert can be displayed (or other error handling)
            case let .loginResponse(.failure(err)):
                print("DEBUG: LOGIN FAILURE \(err)")
                return .none
                
            case .registerButtonTapped:
                return .task { [username = state.username, email = state.email, password = state.password] in
                    await .registerResponse(TaskResult { try await userClient.register(username, email, password) })
                }
                
            case let .registerResponse(.success(userToken)):
                print("DEBUG: REGISTER RESPONSE \(userToken)")
                //encode the struct into json so that it can be saved as data in the keychain
                guard let jsonToken = try? JSONEncoder().encode(userToken) else {
                    return .none
                }
                
                KeychainHelper.standard.save(jsonToken, service: "user-token")
                
                return .none
                
                //Handle the failure for registration here so an alert can be displayed (or other error handling)
            case let .registerResponse(.failure(err)):
                print("DEBUG: REGISTER FAILURE \(err)")
                
                return .none
                
            }
        }
    }
}

