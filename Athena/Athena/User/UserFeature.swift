//
//  UserFeature.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/11/11.
//

import ComposableArchitecture
import Foundation

struct UserState: Equatable {
  var user: User?
}

enum UserAction: Equatable {
  case onAppear
  case dataLoaded(Result<User, APIError>)
}

struct UsersEnvironment {
  var userRequest: (JSONDecoder) -> Effect<User, APIError>
}

//let userReducer = Reducer<
//  UserState,
//  UserAction,
//  SystemEnvironment<UserEnvironment>
//> { state, action, environment in
//  switch action {
//  case .onAppear:
//    return environment.userRequest(environment.decoder())
//      .receive(on: environment.mainQueue())
//      .catchToEffect()
//      .map(UserAction.dataLoaded)
//  case .dataLoaded(let result):
//    switch result {
//    case .success(let user):
//      state.user = user
//    case .failure:
//      break
//    }
//    return .none
//  }
//}
