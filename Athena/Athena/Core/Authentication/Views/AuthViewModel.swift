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
    
    @AppStorage("Access_Token") var isAuthenticated = false {
        willSet { objectWillChange.send() }
    }
    
    @AppStorage("USER_KEY") var username = ""
    @Published var password = ""
    @Published var invalid: Bool = false
    @Published var selectedIndex = 2
    
    private var sampleUser = "username"
    private var samplePassword = "password"
    
    init() {
        print("DEBUG: Currently logged on: \(isAuthenticated)")
        print("DEBUG: Current user: \(username)")
    }
    
    func toggleAuthentication() {
        self.password = ""
        
        withAnimation {
            isAuthenticated.toggle()
        }
    }
    
    func authenticate() {
        guard self.username.lowercased() == sampleUser else {
            self.invalid = true
            return
        }
        
        guard self.password.lowercased() == samplePassword else {
            self.invalid = true
            return
        }
        
        toggleAuthentication()
    }
    
    
    func loginCitizen() {
        
        Webservice().login(username: username, password: password) { result in
            switch result {
            case .success(let access):
                print("DEBUG: Access token is \(access)")
                DispatchQueue.main.async {
                    self.isAuthenticated = true
                }
                
            case .failure(let error):
                print("DEBUG: \(error.localizedDescription)")
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
