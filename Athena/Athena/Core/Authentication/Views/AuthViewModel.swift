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
    
    
//    Authentication User Variables
    @Published var username: String = ""
    @Published var password: String = ""
    
//    Authentication Status Variable
    @Published var isAuthenticated: Bool = false
    
//    Authentication UIView Variable
    @Published var selectedIndex = 2
    
    
    func loginCitizen() {
        
        let defaults = UserDefaults.standard
        
        Webservice().login(username: username, password: password) { result in
            switch result {
            case .success(let access):
                defaults.set(access, forKey: "Bearer Token")
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
        isAuthenticated = false
        selectedIndex = 2
        
    }
    
    func fetchCitizen() {
        print("DEBUG: Handle fetch the logged in user's data...")
    }
    
}
