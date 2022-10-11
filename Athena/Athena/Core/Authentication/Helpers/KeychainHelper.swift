//
//  KeychainHelper.swift
//  Athena
//
//  Created by Dev Jacobson on 2022/10/12.
//

import Foundation

final class KeychainHelper {
    
    static let standard = KeychainHelper()
    private init() {}
    
    func save(_ data: Data, service: String) {
        
        // Create query
        let query = [
            kSecValueData: data,
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service
        ] as CFDictionary
        
        // Add data in query to keychain
        let status = SecItemAdd(query, nil)
        
        if status != errSecSuccess {
            // Print out the error
            print("Error: \(status)")
        }
    }
    
    func read(service: String) -> Data? {
        
        let query = [
            kSecAttrService: service, 
            kSecClass: kSecClassGenericPassword,
            kSecReturnData: true
        ] as CFDictionary
        
        var result: AnyObject?
        SecItemCopyMatching(query, &result)
        
        return (result as? Data)
    }

}
