//
//  SettingsFeature.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/11/29.
//

import Foundation
import ComposableArchitecture

struct SettingsFeature: ReducerProtocol {
    
    struct State: Equatable {
        var isPresented = false
        var route: Route = .idle
    }
    
    enum Route: Equatable {
        case idle
        case help
        case wallet
        case history
        case messages
        case evidence
        case settings
        case legal
    }
    
    enum Action: Equatable {
        case openHelp
        case openWallet
        case openHistory
        case openMessages
        case openEvidence
        case openSettings
        case openLegal
        case onAppear
        case closeSettings
    }
    
    var body: some ReducerProtocol<State, Action>{
        Reduce { state, action in
            switch action {
                
            case .openHelp:
                state.route = .help
                return .none
                
            case .openWallet:
                state.route = .wallet
                return .none
                
            case .openHistory:
                state.route = .history
                return .none
                
            case .openMessages:
                state.route = .messages
                return .none
                
            case .openEvidence:
                state.route = .evidence
                return .none
                
            case .openSettings:
                state.route = .settings
                return .none
                
            case .openLegal:
                state.route = .legal
                return .none
                
            case .onAppear:
                state.isPresented = true
                return .none
                
            case .closeSettings:
                state.route = .idle
                state.isPresented = false
                return .none
            }
        }
    }
}
