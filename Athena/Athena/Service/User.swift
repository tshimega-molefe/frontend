//
//  User.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/28.
//

import Foundation
import SwiftUI

struct User: Codable {
    let access: String
    let refresh: String
    var name: String?
}
