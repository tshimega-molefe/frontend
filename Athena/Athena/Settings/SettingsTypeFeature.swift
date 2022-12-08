//
//  MessagesView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/10/25.
//

import Foundation
import ComposableArchitecture

struct SettingsTypeFeature: ReducerProtocol {
    
    struct State: Equatable {
        var isPresented = true
        var route: SettingsFeature.Route?
        var settingsFeature: SettingsFeature.State?
    }
    
    enum Route: Equatable {
        case settingsFeatureRoute(SettingsFeature.Route)
    }
    
    enum Action: Equatable {
        case settingsFeatureAction(SettingsFeature.Action)
        case dismissView
        case onAppear
    }
    
    var body: some ReducerProtocol<State, Action>{
        Reduce { state, action in
            switch action {
                
            case .settingsFeatureAction(.openHelp):
                state.route = .helpView
                return .none
                
            case .settingsFeatureAction(.openWallet):
                state.route = .walletView
                return .none
                
            case .settingsFeatureAction(.openHistory):
                state.route = .historyView
                return .none
                
            case .settingsFeatureAction(.openMessages):
                state.route = .messagesView
                return .none
                
            case .settingsFeatureAction(.openEvidence):
                state.route = .evidenceView
                return .none
                
            case .settingsFeatureAction(.openAccount):
                state.route = .accountView
                return .none
                
            case .settingsFeatureAction(.openLegal):
                state.route = .legalView
                return .none
                
            case .dismissView:
                state.route = .idle
                state.isPresented = false
                return .none
                
            case .onAppear:
                return .none
            }
        }
    }
}



