//
//  Token.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 13/04/22.
//

import Foundation

struct Token: Codable, Equatable {
    let token: String
    let tokenType: String
    
    func getToken() -> String {
        return "\(tokenType) \(token)"
    }
}

