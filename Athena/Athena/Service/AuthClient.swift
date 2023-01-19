////
////  UserClient.swift
////  Athena
////
////  Created by Devon Jacobson on 2022/12/08.
////
//
//import Foundation
//import Combine
//import SwiftUI
//
//import Combine
//import ComposableArchitecture
//import Foundation
//import XCTestDynamicOverlay
//
//struct FactClient {
//  var fetch: @Sendable (Int) async throws -> String
//}
//
//// This is the "live" fact dependency that reaches into the outside world to fetch trivia.
//// Typically this live implementation of the dependency would live in its own module so that the
//// main feature doesn't need to compile it.
//extension FactClient {
//  static let live = Self(
//    fetch: { number in
//      try await Task.sleep(nanoseconds: NSEC_PER_SEC)
//      let (data, _) = try await URLSession.shared
//        .data(from: URL(string: "http://numbersapi.com/\(number)/trivia")!)
//      return String(decoding: data, as: UTF8.self)
//    }
//  )
//}
//
//#if DEBUG
//  extension FactClient {
//    // This is the "unimplemented" fact dependency that is useful to plug into tests that you want
//    // to prove do not need the dependency.
//    static let unimplemented = Self(
//      fetch: XCTUnimplemented("\(Self.self).fetch")
//    )
//  }
//#endif
//
//
//struct UserClient {
//    var register: @Sendable (String, String, String) async throws -> String
//    var login: @Sendable (String, String) async throws -> String
//    var logout: @Sendable () async throws -> String
//}
//
//extension UserClient {
//    static let live = Self(
//        
//        register: { username, password, email in
//            return "Registered"
//        },
//        login: { username, password in
//            return "Logged In"
//        },
//        logout: {
//            return "Logged Out"
//        }
//        
//    )
//}
//    
////    @AppStorage("Access_Token") var isAuthenticated = false {
////        willSet { objectWillChange.send() }
////    }
////
////    @AppStorage("USER_KEY") var username = ""
////    @Published var password = ""
////    @Published var email = ""
////    @Published var firstName = ""
////    @Published var lastName = ""
////    @Published var cellPhone = ""
////
////
////    @Published var invalid: Bool = false
////    @Published var alreadyExists: Bool = false
////    @Published var selectedIndex = 2
////
////    init() {
////
////        if let data = KeychainHelper.standard.read(service: "access-token"){
////            let accessToken = String(data: data, encoding: .utf8)
////            print("DEBUG: Current username is \(username)")
////            print("DEBUG: Current access token is \(String(describing: accessToken))")
////            self.isAuthenticated = true
////        }
////        else {
////            print("DEBUG: No access token found in keychain")
////            self.isAuthenticated = false
////        }
////    }
////
////
////    func loginCitizen() {
////        Webservice().login(username: username, password: password) { result in
////            DispatchQueue.main.async {
////                switch result {
////                case .success(let accessToken):
////                    print("DEBUG: Access token is \(accessToken)")
////                    let data = Data(accessToken.utf8)
////                    KeychainHelper.standard.save(data, service: "access-token")
////
////                    self.isAuthenticated = true
////                    self.password = ""
////
////                case .failure(let error):
////                    self.invalid = true
////                    print("DEBUG: \(error.localizedDescription)")
////                }
////            }
////        }
////    }
////
////    func registerCitizen() {
////        Webservice().register(username: username, email: email, password: password) { result in
////            DispatchQueue.main.async {
////                switch result {
////                case .success(let accessToken):
////                    print("DEBUG: Access token is \(accessToken)")
////                    let data = Data(accessToken.utf8)
////                    KeychainHelper.standard.save(data, service: "access-token")
////
////                    self.isAuthenticated = true
////                    self.password = ""
////
////                case .failure(let error):
////                    self.alreadyExists = true
////                    print("DEBUG: \(error.localizedDescription)")
////                }
////            }
////        }
////    }
////
////    func updateCitizen(withFirstName firstname: String, lastName: String, cellNumber: String) {
////        print("DEBUG: User Firstname is \(firstname), Lastname is \(lastName), and Phone number is \(cellNumber).")
////    }
////
////    func logoutCitizen() {
////        print("DEBUG: Logged out the current user...")
////        KeychainHelper.standard.delete(service: "access-token")
////
////        DispatchQueue.main.async {
////            self.isAuthenticated = false
////            self.selectedIndex = 2
////        }
////
////    }
////
////    func fetchCitizen() {
////        print("DEBUG: Handle fetch the logged in user's data...")
////    }
////
////}
