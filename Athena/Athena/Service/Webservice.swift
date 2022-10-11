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



class Webservice {
    
    func login(username: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
        
        guard let url = URL(string: "http://localhost:8000/api/users/login/") else {
            completion(.failure(.custom(errorMessage: "DEBUG: URL is not correct...")))
            return
        }
        
        let body = LoginRequestBody(username: username, password: password)
        
        guard let finalBody = try? JSONEncoder().encode(body) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
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
                    
                    // Figure out where to put "isLoggedIn = true"
        
                    completion(.success(access!))
                    
                } else {
                    completion(.failure(.invalidCredentials))
                }
            }
        }
        task.resume()
    }
    
}
