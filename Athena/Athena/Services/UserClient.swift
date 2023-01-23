//
//  UserClient.swift
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
    
    struct LoginRequest: Encodable {
        let username: String
        let password: String
    }
    
    struct RegistrationRequest: Encodable {
        let username: String
        let email: String
        let password: String
    }
    
    enum LoginError: Error {
        //TODO: Add custom error messages / codes to responses to allow for more granular error messages on frontend
        case loginError
    }
    
    enum RegistrationError: Error {
        //TODO: Add custom error messages / codes to responses to allow for more granular error messages on frontend
        case registrationError
    }
    
    var login: @Sendable (String, String) async throws -> UserToken
    var register: @Sendable (String, String, String) async throws -> UserToken
    var getUserProfile: @Sendable () async throws -> UserProfile

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
                        
                        let user = try? JSONDecoder().decode(UserToken.self, from: data)
                        continuation.resume(returning: user!)
                    }
                    else {
                        continuation.resume(throwing: LoginError.loginError)
                    }
                }
            }
            task.resume()
        }
    },
    
    register: { username, email, password in
        try await Task.sleep(nanoseconds: NSEC_PER_SEC)
        return try await withCheckedThrowingContinuation { continuation in
            
            guard let url = URL(string: "http://localhost:8000/api/users/citizen/register/") else {
                continuation.resume(throwing: RegistrationError.registrationError)
                return
            }
            
            let body = RegistrationRequest(username: username, email: email, password: password)
            
            guard let finalBody = try? JSONEncoder().encode(body) else {
                return
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = finalBody
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                guard let data = data, error == nil else {
                    continuation.resume(throwing: RegistrationError.registrationError)
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 201 {
                        
                        let user = try? JSONDecoder().decode(UserToken.self, from: data)
                        continuation.resume(returning: user!)
                    }
                    else {
                        continuation.resume(throwing: RegistrationError.registrationError)
                    }
                }
            }
            task.resume()
        }
    },
    
    getUserProfile: {
        return UserProfile(id: 0, user: User(username: "", email: "", first_name: "", last_name: ""), home_address: "", contact_number: "", birth_date: "", profile_image: "", sex: "", race: "")
    }
  )
}

private enum UserClientKey: DependencyKey {
    static var liveValue = UserClient.live
}

extension DependencyValues {
    var userClient: UserClient {
        get { self[UserClientKey.self] }
        set { self[UserClientKey.self] = newValue }
    }
}
