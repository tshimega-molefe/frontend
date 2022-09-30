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
    
    
    func checkLogin(password: String, username: String) {
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
            print("RESULT: \(result)")
            if let result = result {
                DispatchQueue.main.async {
                    self.isLoggedIn = true
                }
            } else {
                DispatchQueue.main.async {
                    self.isCorrect = false
                }
            }
        }.resume()
    }
    
    
    
    func login(withUsername username: String, password: String) {
        print("DEBUG: Log In with username \(username)")
    }
    
    func register(withUsername username: String, password: String, fullname: String, email: String) {
        print("DEBUG: Create Account with username \(username)")
    }
    
}
