//
//  Encodable+Json.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 13/04/22.
//

import Foundation

extension Encodable {
    func toJson() -> Data? {
        return try? Json.encoder.encode(self)
    }
}

