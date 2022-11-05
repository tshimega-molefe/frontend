//
//  Emergency.swift
//  Athena
//
//  Created by Dev Jacobson on 2022/11/05.
//

import Foundation

class Emergency: Identifiable, ObservableObject {
    // MARK: Stored Properties
    
    enum Status {
        case idle
        case confirming
        case requested
        case accepted
        case inProgress
        case completed
        case cancelled
    }
    
    var id: UUID?
    var security: UUID?
    @Published var status: Status?
    
    init(id: UUID? = nil, security: UUID? = nil, status: Status? = .idle) {
        self.id = id
        self.security = security
        self.status = status
    }
}

