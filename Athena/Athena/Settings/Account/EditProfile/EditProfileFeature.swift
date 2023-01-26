//
//  EditProfileFeature.swift
//  Athena
//
//  Created by Tshimega Belmont on 2023/01/19.
//

import Foundation
import SwiftUI
import ComposableArchitecture

struct EditProfileFeature: ReducerProtocol {    
    
    struct State: Equatable {
        var name: String = ""
        var email: String = ""
        var profileImage: Image?
        
        var route: Route = .notEditing
        var userProfile: UserProfile?
    }
    
    enum Route: Equatable {
        case notEditing
        case editing
    }
    
    enum Action: Equatable {
        case editProfile
        case nameChanged
        case emailChanged
        case selectProfileImage
        case cancelChanges
        case saveChanges
    }
    
    var body: some ReducerProtocol<State, Action>{
        Reduce { state, action in
            
            switch action {
                
            case .editProfile:
                state.route = .editing
                return .none
                
            case .selectProfileImage:
                // Open an alert that prompts the user to either take a new photo using their camera, or to select an image from their gallery.
                print("DEBUG: Handle select/take profile image...")
                return .none
                
            case .saveChanges:
                print("DEBUG: Handle update and save user information...")
                return .none
                
            case .cancelChanges:
                print("DEBUG: Handle cancel changes to profile information...")
                state.route = .notEditing
                return .none
                
            case .nameChanged:
                return .none
                
            case .emailChanged:
                return .none
            }
        }
    }
}
