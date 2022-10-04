//
//  User.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/28.
//

import Foundation
import SwiftUI

struct User: Codable {
    let success: Bool?
    let access: String
    let refresh: String
    let firstName: String?
    let lastName: String?
    let phoneNumber: String?
    
}
