//
//  User.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/28.
//

import Foundation
import SwiftUI
import ComposableArchitecture

struct User: Equatable, Codable {
    var username: String
    var email: String
    var first_name: String?
    var last_name: String?
}

struct UserProfile: Equatable, Codable {
    var id: Int
    var user: User
    var home_address: String?
    var contact_number: String?
    var birth_date: String?
    var profile_image: String?
    var sex: String?
    var race: String?
}

struct UserToken: Equatable, Codable {
    var access: String
    var refresh: String
}
