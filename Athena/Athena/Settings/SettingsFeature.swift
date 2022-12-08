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
        var route: Route = .idle
    }
    
    enum Route: Equatable {
        case idle
        case helpView
        case walletView
        case historyView
        case messagesView
        case evidenceView
        case accountView
        case legalView
    }
    
    enum Action: Equatable {
        case openHelp
        case openWallet
        case openHistory
        case openMessages
        case openEvidence
        case openAccount
        case openLegal
    }
    
    var body: some ReducerProtocol<State, Action>{
        Reduce { state, action in
            switch action {
                
            case .openHelp:
                state.route = .helpView
                return .none
                
            case .openWallet:
                state.route = .walletView
                return .none
                
            case .openHistory:
                state.route = .historyView
                return .none
                
            case .openMessages:
                state.route = .messagesView
                return .none
                
            case .openEvidence:
                state.route = .evidenceView
                return .none
                
            case .openAccount:
                state.route = .accountView
                return .none
                
            case .openLegal:
                state.route = .legalView
                return .none
            }
        }
    }
}
