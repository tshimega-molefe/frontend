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

    @Published var isCorrect : Bool = true
    
    
    @Published var isLoggedIn = false 
    
    
    func loginUser(password: String, username: String) {
        guard let url = URL(string: "http://localhost:8000/api/users/login/") else { return }
        
        let body : [String: String] = ["password": password, "username": username]
        
        guard let finalBody = try? JSONEncoder().encode(body) else { return }
        
        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = finalBody
        
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in

            guard let data = data, error == nil else { return }
            
//            decode data
            let result = try? JSONDecoder().decode(User.self, from: data)
            
            if let result = result {
                print("DEBUG: HTTP post result is \(result)")
                
                DispatchQueue.main.async {
                        self.isLoggedIn = true
                }
            } else {
                DispatchQueue.main.async {
                    self.isCorrect = false
                }
            }
        }.resume()
        
        print("DEBUG: Logged in user with username \(username) and password \(password)")
    }
    
    func registerUser(withUsername username: String, email: String, password: String) {
        print("DEBUG: Create Account with username \(username) & email \(email)")
    }
    
    func updateUser(withFirstName firstname: String, lastName: String, cellNumber: String) {
        print("DEBUG: User Firstname is \(firstname), Lastname is \(lastName), and Phone number is \(cellNumber).")
    }
    
}
