//
//  SettingsView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/26.
//

import SwiftUI
import ComposableArchitecture


struct SettingsView: View {
    @Environment(\.presentationMode) private var presentationMode
    
    @ObservedObject var viewStore: ViewStore<SettingsFeature.State, SettingsFeature.Action>
    let store: Store<SettingsFeature.State, SettingsFeature.Action>
    
    init(store: Store<SettingsFeature.State, SettingsFeature.Action>) {
      self.store = store
      self.viewStore = ViewStore(self.store)
    }

    var body: some View {
            
            switch viewStore.state.route {

            case .idle:
                // TODO: Extract this Idle View to an ExtractedView
                VStack (alignment: .leading) {
                    HStack {
                        VStack (alignment: .leading, spacing: 20) {
                            ProfileTab()
                            
                            HStack (alignment: .center, spacing: 20) {
                                SettingsTab(tabType: .help) {
                                    viewStore.send(.openHelp)
                                }
                                SettingsTab(tabType: .wallet) {
                                    viewStore.send(.openWallet)
                                }
                                SettingsTab(tabType: .history) {
                                    viewStore.send(.openHistory)
                                }
                                
                            }
                        }.padding(.horizontal)
                    }
                    
                    Divider()
                        .padding(.bottom)
                        .shadow(color: Color.theme.shadow, radius: 7)
                    
                    ScrollView {
                    VStack (alignment: .leading, spacing: 60) {
                        
                        SettingsRow(rowType: .messages) {
                            viewStore.send(.openMessages)
                        }
                        SettingsRow(rowType: .evidence) {
                            viewStore.send(.openEvidence)
                        }
                        SettingsRow(rowType: .settings) {
                            viewStore.send(.openAccount)
                        }
                        SettingsRow(rowType: .legal) {
                            viewStore.send(.openLegal)
                        }
                    }
                }
            }
            case .settingsTypeRoute(.null):
                SettingsTypeFeature.Route.null
                
            case .settingsTypeRoute(.helpView):
                SettingsTypeFeature.Route.helpView
                
            case .settingsTypeRoute(.walletView):
                SettingsTypeFeature.Route.walletView
                
            case .settingsTypeRoute(.historyView):
                SettingsTypeFeature.Route.historyView
                
            case .settingsTypeRoute(.messagesView):
                SettingsTypeFeature.Route.messagesView
                
            case .settingsTypeRoute(.evidenceView):
                SettingsTypeFeature.Route.evidenceView
                
            case .settingsTypeRoute(.accountView):
                SettingsTypeFeature.Route.accountView
                
            case .settingsTypeRoute(.legalView):
                SettingsTypeFeature.Route.legalView
        
            }
        }
    }


struct ProfileTab: View {
    @EnvironmentObject var userAuth: AuthViewModel
    
    var body: some View {
        HStack (alignment: .top) {
            Image("sabrina")
                .resizable()
                .frame(width: 58, height: 58)
                .clipShape(Circle())
            
            VStack (alignment: .leading) {
                Text("Sabrina Morreno")
                    .font(.custom(FontsManager.Poppins.regular, size: 18))
                    .foregroundColor(Color.theme.primaryText)
                
                Text("Douglasdale, Fourways")
                    .font(.custom(FontsManager.Poppins.light, size: 14))
                    .foregroundColor(Color.theme.secondaryText)
            }
        }
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(store: Store(initialState: SettingsFeature.State(),
                                  reducer: AnyReducer(SettingsFeature()),
                                 environment: ()))
    }
}
