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
    @EnvironmentObject var userAuth: AuthViewModel
    
    
    struct State: Equatable {
        var route: Route = .notEditing
    }
    
    enum Route: Equatable {
        case notEditing
        case editing
    }
    
    enum Action: Equatable {
        case selectProfileImage
        case save
    }
    
    var body: some ReducerProtocol<State, Action>{
        Reduce { state, action in
            
            switch action {
            case .selectProfileImage:
                // Open an alert that prompts the user to either take a new photo using their camera, or to select an image from their gallery.
                print("DEBUG: Handle update profile image..")
                return .none
            case .save:
                print("DEBUG: Handle Update and save user information...")
                return .none
            }
        }
    }
}
