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
        case settingsTypeRoute(SettingsTypeFeature.Route)
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
                state.route = .settingsTypeRoute(.helpView)
                return .none
                
            case .openWallet:
                state.route = .settingsTypeRoute(.walletView)
                return .none
                
            case .openHistory:
                state.route = .settingsTypeRoute(.historyView)
                return .none
                
            case .openMessages:
                state.route = .settingsTypeRoute(.messagesView)
                return .none
                
            case .openEvidence:
                state.route = .settingsTypeRoute(.evidenceView)
                return .none
                
            case .openAccount:
                state.route = .settingsTypeRoute(.accountView)
                return .none
                
            case .openLegal:
                state.route = .settingsTypeRoute(.legalView)
                return .none
            }
        }
    }
}
