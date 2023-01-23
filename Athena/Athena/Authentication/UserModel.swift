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
    let username: String
    let email: String
    let first_name: String?
    let last_name: String?
}

struct UserProfile: Equatable, Codable {
    let id: Int
    let user: User
    let home_address: String?
    let contact_number: String?
    let birth_date: String?
    let profile_image: String?
    let sex: String?
    let race: String?
}

struct UserToken: Equatable, Codable {
    let access: String
    let refresh: String
}
