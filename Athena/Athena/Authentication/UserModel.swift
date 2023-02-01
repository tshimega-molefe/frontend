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
}

struct UserProfile: Equatable, Codable {
    var id: Int = 0
    var user: User = User(username: "", email: "")
    var full_name: String = ""
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
