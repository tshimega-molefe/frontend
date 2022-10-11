//
//  AuthViewModel.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/26.
//

import Foundation
import Combine
import SwiftUI

class AuthViewModel: ObservableObject {
    var didChange = PassthroughSubject<AuthViewModel, Never>()
    
    //@AppStorage("Authentication_Status") var isAuthenticated = (!username.isEmpty() || !username.isExpired() ) ? true : false - where accessToken is from the keychain
    
    @AppStorage("Access_Token") var isAuthenticated = false {
        willSet { objectWillChange.send() }
    }
    
    @AppStorage("USER_KEY") var username = ""
    @Published var password = ""
    @Published var invalid: Bool = false
    @Published var selectedIndex = 2
    
    init() {
        print("DEBUG: Currently logged on: \(isAuthenticated)")
        print("DEBUG: Current user: \(username)")
        
        
    }
    
    func toggleAuthentication() {
        
        withAnimation {
            isAuthenticated = false
        }
    }
    
    func loginCitizen() {
        Webservice().login(username: username, password: password) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let accessToken):
                    print("DEBUG: Access token is \(accessToken)")
                    
                    self.isAuthenticated = true
                    self.password = ""
                    
                case .failure(let error):
                    self.invalid = true
                    print("DEBUG: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func registerCitizen(withUsername username: String, email: String, password: String) {
        print("DEBUG: Create Account with username \(username) & email \(email).")
    }
    
    func updateCitizen(withFirstName firstname: String, lastName: String, cellNumber: String) {
        print("DEBUG: User Firstname is \(firstname), Lastname is \(lastName), and Phone number is \(cellNumber).")
    }
    
    func logoutCitizen() {
        print("DEBUG: Logged out the current user...")
        DispatchQueue.main.async {
            self.toggleAuthentication()
            self.selectedIndex = 2
        }
        
    }
    
    func fetchCitizen() {
        print("DEBUG: Handle fetch the logged in user's data...")
    }
    
}
