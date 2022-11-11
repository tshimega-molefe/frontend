//
//  PressForHelpView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/26.
//

import SwiftUI
import CoreLocation
import ComposableArchitecture

struct EmergencyState: Equatable {
    var displayState: DisplayState = .idle
//    var emergency: Emergency?
    enum DisplayState: Equatable {
        case idle
        case confirming
        case searching
        case accepted
    }
}

enum EmergencyAction: Equatable {
    case onAppear
    case request
    case confirm
    case cancel
}

struct EmergencyEnvironment {
//  var emergencyRequest: (JSONDecoder) -> Effect<[RepositoryModel], APIError>
}

let reducer = ComposableArchitecture.Reducer(<#T##reducer: (inout State, Action, Environment) -> EffectTask<Action>##(inout State, Action, Environment) -> EffectTask<Action>#>)

let emergencyReducer = Reducer<
  EmergencyState,
  EmergencyAction,
  AppEnvironment<EmergencyEnvironment>
> { state, action, environment in
    switch action {
    case .onAppear:
        print("DEBUG: Emergency View Appeared..")
    case .idle:
        print("DEBUG: View is idle..")
    case .confirming:
        print("DEBUG: View is confirming..")
    case .searching:
        print("DEBUG: View is searching for security..")
    case .accepted:
        print("DEBUG: View is accepted..")
    }
    
    
}

struct EmergencyView: View {
    
    @Binding var emergencyStatus: Emergency.Status?
    
    let coordinate = CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868)
    var body: some View {
        VStack {
            NavigationLink(destination: ConfirmView(state: $emergencyStatus),
                           tag: Emergency.Status.confirming, selection: $emergencyStatus) {
                EmergencyButton()
            }
            
            NavigationLink(destination: RequestedView(),
                           tag: Emergency.Status.requested, selection: $emergencyStatus) {
                EmptyView()
            }
        }
    }
}

struct PressForHelpView_Previews: PreviewProvider {
    static var previews: some View {
        EmergencyView(emergencyStatus: .constant(.confirming))
    }
}

