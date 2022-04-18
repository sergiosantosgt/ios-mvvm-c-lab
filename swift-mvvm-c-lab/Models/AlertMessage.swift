//
//  AlertMessage.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 13/04/22.
//

import Foundation

struct AlertMessage: Equatable {
    static func == (lhs: AlertMessage, rhs: AlertMessage) -> Bool {
        return lhs.title == rhs.title && lhs.message == rhs.message
    }
    
    let title: String
    let message: String
    let buttons: [String]
    let actions: [String:() -> Void]
}
