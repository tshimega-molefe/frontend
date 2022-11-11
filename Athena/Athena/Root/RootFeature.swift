//
//  RootFeature.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/11/11.
//

import ComposableArchitecture

struct AppState {
  var userState = UserState()
//  var repositoryState = RepositoryState()
}

enum AppAction {
  case userAction(UserAction)
//  case repositoryAction(RepositoryAction)
}

//struct AppEnvironment { }

// swiftlint:disable trailing_closure
//let rootReducer = Reducer<
//  RootState,
//  RootAction,
//  SystemEnvironment<RootEnvironment>
//>.combine(
//  userReducer.pullback(
//    state: \.userState,
//    action: /RootAction.userAction,
//    environment: { _ in .live(environment: UserEnvironment(userRequest: userEffect)) }),
//  // 1
//  repositoryReducer.pullback(
//    // 2
//    state: \.repositoryState,
//    // 3
//    action: /RootAction.repositoryAction,
//    // 4
//    environment: { _ in
//      .live(
//        environment: RepositoryEnvironment(repositoryRequest: repositoryEffect))
//    }))
