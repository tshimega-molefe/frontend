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
    
    struct UpdateRequest: Encodable {
        let sex: String?
        let race: String?
        let contact_number = ""
        let birth_date: String?
        let profile_image: String?
        let home_address: String?
        let full_name: String
    }
    
    enum LoginError: Error {
        //TODO: Add custom error messages / codes to responses to allow for more granular error messages on frontend
        case loginError
    }
    
    enum RegistrationError: Error {
        //TODO: Add custom error messages / codes to responses to allow for more granular error messages on frontend
        case registrationError
    }
    
    enum ProfileError: Error {
        case getError
        case updateError
    }
    
    var login: @Sendable (String, String) async throws -> UserToken
    var register: @Sendable (String, String, String) async throws -> UserToken
    var getUserProfile: @Sendable (String) async throws -> UserProfile
    var updateUserProfile: @Sendable (UserProfile, String) async throws -> UserProfile
    
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
                            //TODO: Look into how to fix this forced unwrap
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
        
        getUserProfile: { accessToken in
            
            try await Task.sleep(nanoseconds: NSEC_PER_SEC)
            return try await withCheckedThrowingContinuation { continuation in
                
                guard let url = URL(string: "http://localhost:8000/api/users/profile/") else {
                    continuation.resume(throwing: ProfileError.getError)
                    return
                }
                
                var request = URLRequest(url: url)
                request.httpMethod = "GET"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.setValue( "Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
                
                let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                                        
                    guard let data = data, error == nil else {
                        continuation.resume(throwing: ProfileError.getError)
                        return
                    }
                    
                    if let httpResponse = response as? HTTPURLResponse {
                        if httpResponse.statusCode == 200 {
                            do {
                                let profileData = try JSONDecoder().decode(UserProfile.self, from: data)
                                continuation.resume(returning: profileData)

                            }
                            
                            catch let jsonError as NSError {
                                let str = String(decoding: data, as: UTF8.self)
                                print(str)
                                continuation.resume(throwing: ProfileError.getError)
                                print("JSON decode failed: \(jsonError)")
                                return
                              }

                        }
                        else {
                            continuation.resume(throwing: ProfileError.getError)
                        }
                    }
                    

                }
                task.resume()
            }
        },
        updateUserProfile: { userProfile, accessToken in
            try await Task.sleep(nanoseconds: NSEC_PER_SEC)
            return try await withCheckedThrowingContinuation { continuation in
                
                guard let url = URL(string: "http://localhost:8000/api/users/citizen/update/") else {
                    continuation.resume(throwing: ProfileError.updateError)
                    return
                }
                
                print("DEBUG: USERPROFILE UPDATE: \(userProfile)")
                
                let body = UpdateRequest(sex: userProfile.sex, race: userProfile.race, birth_date: userProfile.birth_date, profile_image: userProfile.profile_image, home_address: userProfile.home_address, full_name: userProfile.full_name)
                
                guard let finalBody = try? JSONEncoder().encode(body) else {
                    return
                }
                                
                var request = URLRequest(url: url)
                request.httpMethod = "PATCH"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.setValue( "Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
                request.httpBody = finalBody
                
                let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                                        
                    guard let data = data, error == nil else {
                        continuation.resume(throwing: ProfileError.updateError)
                        return
                    }
                    
                    if let httpResponse = response as? HTTPURLResponse {
                        if httpResponse.statusCode == 200 {
                            do {
                                let profileData = try JSONDecoder().decode(UserProfile.self, from: data)
                                print("DEBUG: USERPROFILE UPDATE: \(profileData)")
                                continuation.resume(returning: profileData)
                            }
                            
                            catch let jsonError as NSError {
                                let str = String(decoding: data, as: UTF8.self)
                                print(str)
                                continuation.resume(throwing: ProfileError.updateError)
                                print("JSON decode failed: \(jsonError)")
                                return
                              }

                        }
                        else {
                            continuation.resume(throwing: ProfileError.getError)
                        }
                    }
                    

                }
                task.resume()
            }
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
