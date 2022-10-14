//
//  WebService.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/10/11.
//

import Foundation


    // MARK: - Login

enum AuthenticationError: Error {
    case invalidCredentials
    case custom(errorMessage: String)
}

struct LoginRequestBody: Codable {
    let username: String
    let password: String
}

struct LoginResponseBody: Codable {
    let access: String?
    let refresh: String?
    
}

    // MARK: - Register

enum RegistrationError: Error {
    case credentialsAlreadyExist
    case custom(errorMessage: String)
}

struct RegisterRequestBody: Codable {
    let username: String
    let email: String
    let password: String
}

struct RegisterResponseBody: Codable {
    let access: String?
    let refresh: String?
    
}

    // MARK: - Update



class Webservice {
    
//    MARK: - LoginCitizen WebService
    
    func login(username: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
        
        guard let url = URL(string: "http://localhost:8000/api/users/login/") else {
            completion(.failure(.custom(errorMessage: "DEBUG: URL is not correct...")))
            return
        }
        
        let body = LoginRequestBody(username: username, password: password)
        
        guard let finalBody = try? JSONEncoder().encode(body) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = finalBody
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: "DEBUG: There is no data...")))
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    
                    let loginResponse = try? JSONDecoder().decode(LoginResponseBody.self, from: data)
                    
                    let access = loginResponse?.access
                    
                    completion(.success(access!))
                    
                } else {
                    completion(.failure(.invalidCredentials))
                }
            }
        }
        task.resume()
    }
    
//    MARK: - RegisterCitizen WebService
    
    func register(username: String, email: String, password: String, completion: @escaping (Result<String, RegistrationError>) -> Void) {
        
        guard let url = URL(string: "http://localhost:8000/api/users/citizen/register") else {
            completion(.failure(.custom(errorMessage: "DEBUG: URL is not correct...")))
            return
        }
        
        let body = RegisterRequestBody(username: username, email: email, password: password)
        
        guard let finalBody = try? JSONEncoder().encode(body) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = finalBody
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: "DEBUG: There is no data...")))
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 201 {
                    
                    let registerResponse = try? JSONDecoder().decode(RegisterResponseBody.self, from: data)
                    
                    let access = registerResponse?.access
                    
                    completion(.success(access!))
                    
                } else {
                    completion(.failure(.credentialsAlreadyExist))
                }
            }
        }
        task.resume()
            
        
        
    }
    
    
    
    
    
//    MARK: - UpdateCitizen WebService
    
    
    
    
    
    
//    MARK: - FetchCitizen WebService
    
}
