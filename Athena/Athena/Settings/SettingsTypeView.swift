//
//  EvidenceView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/10/25.
//

import SwiftUI
import ComposableArchitecture

struct EvidenceView: View {
    @Environment(\.presentationMode) private var presentationMode
    
    @ObservedObject var viewStore: ViewStore<SettingsTypeFeature.State, SettingsTypeFeature.Action>
    let store: Store<SettingsTypeFeature.State, SettingsTypeFeature.Action>
    
    init(store: Store<SettingsTypeFeature.State, SettingsTypeFeature.Action>) {
      self.store = store
      self.viewStore = ViewStore(self.store)
    }

    var body: some View {
        
        switch viewStore.state.route {
        case .null:
            Text("Null")
        case .helpView:
            Text("HelpView")
        case .walletView:
            Text("HelpView")
        case .historyView:
            Text("HelpView")
        case .messagesView:
            Text("HelpView")
        case .evidenceView:
            Text("HelpView")
        case .accountView:
            Text("HelpView")
        case .legalView:
            Text("HelpView")
        }
        
        
        CancelButton(imageName: "xmark", font: .callout) {
            self.presentationMode.wrappedValue.dismiss()
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct EvidenceView_Previews: PreviewProvider {
    static var previews: some View {
        EvidenceView(store: Store(initialState: SettingsTypeFeature.State(),
                                  reducer: AnyReducer(SettingsTypeFeature()),
                                 environment: ()))
    }
}
