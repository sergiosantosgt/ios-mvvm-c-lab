//
//  TranslationsResponse.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 13/04/22.
//

import Foundation

typealias Languages = [String:[String:String]]

struct TranslationsResponse: Codable {
    let languages: Languages
}

