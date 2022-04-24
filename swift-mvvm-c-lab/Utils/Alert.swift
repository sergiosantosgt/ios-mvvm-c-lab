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
    var actionTitle: String
    
    init(title: String, message: String, actionTitle: String) {
        self.title = title
        self.message = message
        self.actionTitle = actionTitle
    }
    
    func getAlert(actionCancel: Bool = true) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if(actionCancel) {
            let action = UIAlertAction(title: actionTitle, style: .cancel, handler: nil)
            alert.addAction(action)
        }
        return alert
    }
}
