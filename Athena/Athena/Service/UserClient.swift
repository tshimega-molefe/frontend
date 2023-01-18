//
//  HTTPClient.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/12/19.
//

import Combine
import ComposableArchitecture
import Foundation
import XCTestDynamicOverlay
import SwiftUI

struct UserClient {
    
    struct LoginRequest: Codable {
        let username: String
        let password: String
    }
    
    struct LoginResponse: Codable {
        let access: String?
        let refresh: String?
    }
    
    enum LoginError: Error {
        case loginError
    }
    
  var login: @Sendable (String, String) async throws -> User

}

extension UserClient {
  static let live = Self(
    login: { username, password in
        try await Task.sleep(nanoseconds: NSEC_PER_SEC)
        return try await withCheckedThrowingContinuation { continuation in
            
            guard let url = URL(string: "http://localhost:8000/api/users/login/") else {
                continuation.resume(throwing: LoginError.loginError)
                return
            }
            
            let body = LoginRequest(username: username, password: password)
            
            guard let finalBody = try? JSONEncoder().encode(body) else {
                return
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = finalBody
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                guard let data = data, error == nil else {
                    continuation.resume(throwing: LoginError.loginError)
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200 {
                        
                        let user = try? JSONDecoder().decode(User.self, from: data)
                        continuation.resume(returning: user!)
                    }
                    else {
                        continuation.resume(throwing: LoginError.loginError)
                    }
                }
            }
            task.resume()
        }
    }
  )
}

    
