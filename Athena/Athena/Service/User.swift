//
//  User.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/28.
//

import Foundation
import SwiftUI

struct UserLogin: Codable, Identifiable {
    let id = UUID()
    let success: Bool
    let token: String
    let expires: Int
    let currentUser: Int
    let user: String
    let role: Int
    let isVerified: Int
}
