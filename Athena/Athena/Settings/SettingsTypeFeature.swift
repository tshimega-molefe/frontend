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
        var route: Route = .null
        var isPresented = false
    }
    
    enum Route: Equatable {
        case null
        case helpView
        case walletView
        case historyView
        case messagesView
        case evidenceView
        case accountView
        case legalView
    }
    
    enum Action: Equatable {
        case settingsFeatureAction(SettingsFeature.Action)
        case closeView
        case onAppear
    }
    
    var body: some ReducerProtocol<State, Action>{
        Reduce { state, action in
            switch action {
                
            case .settingsFeatureAction(.openHelp):
                state.isPresented = true
                return .none
                
            case .settingsFeatureAction(.openWallet):
                state.isPresented = true
                return .none
                
            case .settingsFeatureAction(.openHistory):
                state.isPresented = true
                return .none
                
            case .settingsFeatureAction(.openMessages):
                state.isPresented = true
                return .none
                
            case .settingsFeatureAction(.openEvidence):
                state.isPresented = true
                return .none
                
            case .settingsFeatureAction(.openAccount):
                state.isPresented = true
                return .none
                
            case .settingsFeatureAction(.openLegal):
                state.isPresented = true
                return .none
                
            case .closeView:
                state.isPresented = false
                return .none
                
            case .onAppear:
                return .none
            }
        }
    }
}



