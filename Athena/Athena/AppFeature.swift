//
//  AppFeature.swift
//  Athena
//
//  Created by Dev Jacobson on 2023/01/25.
//

import Foundation

import ComposableArchitecture

struct AppFeature: ReducerProtocol {
    
    struct State: Equatable {
    }
 
    enum Action: Equatable {
    }
    
    
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            return .none
        }
    }
}

