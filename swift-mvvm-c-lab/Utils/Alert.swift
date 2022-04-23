//
//  Alert.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 18/04/22.
//

import UIKit


class Alert {
    
    var title: String
    var message: String
    var action: String
    
    init(title: String, message: String, action: String) {
        self.title = title
        self.message = message
        self.action = action
    }
    
    func getAlert() -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let  actionCancel = UIAlertAction(title: action, style: .cancel, handler: nil)
        alert.addAction(actionCancel)
        return alert
    }
}
