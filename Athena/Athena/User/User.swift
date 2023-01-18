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
    let password: String
}

