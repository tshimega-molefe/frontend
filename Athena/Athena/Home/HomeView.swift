//
//  MainTabView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/26.
//

import SwiftUI
import ComposableArchitecture

struct HomeView: View {
    let store: Store<HomeFeature.State, HomeFeature.Action>
    
    var body: some View {
        
        WithViewStore(self.store) { viewStore in
            Group {
                
                IfLetStore(
                    self.store.scope(
                        state: \.authFeature,
                        action: HomeFeature.Action.authAction
                    ),
                    then: { authStore in
                        AuthenticationView(store: authStore)
                    },
                    else: {
                        TabView(selection: viewStore.binding(get: \.route, send: HomeFeature.Action.onAppear)) {
                            StatusView()
                                .tabItem {
                                    Image(systemName: "location.circle")
                                    Text("Status")
                                }.tag(HomeFeature.Route.status)
                            
                            NavigationView {
                                SecurityView(locationService: LocationSearchService())
                            }
                            .tabItem {
                                Image(systemName: "waveform.path.ecg")
                                Text("Security")
                            }.tag(HomeFeature.Route.security)
                            
                            NavigationView {
                                NavigationLink(destination: EmergencyView(store: Store(
                                    initialState: EmergencyFeature.State(),
                                    reducer: AnyReducer(EmergencyFeature()),
                                    environment: ()))) {
                                        EmergencyButton()
                                    }
                            }
                            .tabItem {
                                Image(systemName: "cross.circle")
                                Text("Help")
                            }.tag(HomeFeature.Route.emergency)
                            
                            SearchView()
                                .tabItem {
                                    Image(systemName: "magnifyingglass")
                                    Text("Search")
                                }.tag(HomeFeature.Route.search)
                            
                            NavigationView {
                                SettingsView(store: Store(initialState: SettingsFeature.State(userProfile: viewStore.profile.userProfile),
                                                          reducer: AnyReducer(SettingsFeature()),
                                                          environment: ()))
                            }
                            .tabItem {
                                Image(systemName: "gear")
                                Text("Settings")
                            }.tag(HomeFeature.Route.settings)
                        }
                    }
                )
            }.onAppear { viewStore.send(.onAppear) }
        }
    }
}
