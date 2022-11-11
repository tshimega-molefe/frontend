//
//  User.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/28.
//

import Foundation
import SwiftUI

struct User: Codable, Equatable {
    let email: String?
    let username: String
    let first_name: String?
    let last_name: String?
    let phone_number: String?
}

extension User: Identifiable {
    var id: String { username }
}
