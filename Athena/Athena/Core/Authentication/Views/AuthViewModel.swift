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
    
    @Published var username: String = ""
    @Published var password: String = ""
    
    
    @Published var isCorrect : Bool = true
    @Published var isLoggedIn = false 
    
    
    func loginCitizen() {
        
        Webservice().login(username: username, password: password) { result in
            switch result {
            case .success(let access):
                print(access)
            case .failure(let error):
                print(error.localizedDescription)
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
        isLoggedIn = false
    }
    
    func fetchCitizen() {
        print("DEBUG: Handle fetch the logged in user's data...")
    }
    
}
