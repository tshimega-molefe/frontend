//
//  ProfileFeature.swift
//  Athena
//
//  Created by Dev Jacobson on 2023/01/25.
//

import Foundation
import ComposableArchitecture

class ProfileFeature: ReducerProtocol {
    
    @Dependency(\.userClient) private var userClient
    
    struct State: Equatable {
        @BindableState var userProfile: UserProfile = UserProfile()
        var userToken: UserToken = UserToken(access: "", refresh: "")
        var isEditing: Bool = false
    }
    
    enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        case getUserProfile(UserToken)
        case getUserProfileResponse(TaskResult<UserProfile>)
        case updateUserProfileResponse(TaskResult<UserProfile>)
        case editProfile
        case saveChanges
        case cancelChanges
    }
    
    var body: some ReducerProtocol<State, Action>{
        
        BindingReducer()
        
        Reduce { state, action in
            
            switch action {
          
            case .binding:
                return .none

            case let .getUserProfile(userToken):
                state.userToken = userToken
                
                return .task {
                    await .getUserProfileResponse(TaskResult { try await self.userClient.getUserProfile(userToken.access) })
                }
                
                
            case let .getUserProfileResponse(.success(userProfile)):
                state.userProfile = userProfile
                
                if let encodedProfile = try? JSONEncoder().encode(userProfile) {
                    UserDefaults.standard.set(encodedProfile, forKey: "UserProfile")
                }
                            
                return .none
            
            case let .getUserProfileResponse(.failure(err)):
                print("DEBUG: PROFILE FAILURE \(err)")
                
                return .none
                
            case let .updateUserProfileResponse(.success(userProfile)):
                state.userProfile = userProfile
                print(userProfile)
                return .none
                
            case let .updateUserProfileResponse(.failure(err)):
                print("There was a problet updating profile: \(err)")
                return .none
                
            case .editProfile:
                state.isEditing = true
                return .none
            
            case .saveChanges:
                print(state.userProfile)
                state.isEditing = false
                
                return .task { [userProfile = state.userProfile, userToken = state.userToken] in
                    await .updateUserProfileResponse(TaskResult {try await self.userClient.updateUserProfile(userProfile, userToken.access)} )
                }
                
            case .cancelChanges:
                state.isEditing = false
                return .none
                
            }
        }
    }
}
