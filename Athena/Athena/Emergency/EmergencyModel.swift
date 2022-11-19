//
//  Emergency.swift
//  Athena
//
//  Created by Dev Jacobson on 2022/11/05.
//

import Foundation

class EmergencyModel: Identifiable, Codable {
    // MARK: Stored Properties
    
    var type: String?
    //Should proably be UUID but I cant get it to work
    var id: String?
    var security: String?
    
}

