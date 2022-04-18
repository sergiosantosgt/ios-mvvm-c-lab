//
//  Data+Json.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 13/04/22.
//

import Foundation

extension Data {
    func toObject<T:Codable>(_ type: T.Type) -> T? {
        if type == VoidResponse.self {
            return VoidResponse() as? T
        }
        return try? Json.decoder.decode(type, from: self)
    }
}
