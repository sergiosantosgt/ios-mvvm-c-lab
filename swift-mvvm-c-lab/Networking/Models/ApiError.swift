//
//  ApiError.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 13/04/22.
//

import Foundation

enum ApiError: Error {
    case requestFailed(statusCode: Int?, response: Data?)
}
