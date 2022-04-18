//
//  AlertDispatcher.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 13/04/22.
//

import Foundation
import UIKit

class AlertDispatcher {
    private var lastError: AlertMessage?
    
    func dispatch(error: AlertMessage) {
        guard lastError != error else { return }
        lastError = error

        if let viewController = UIApplication.shared.keyWindow?.rootViewController {
            showAlert(on: viewController, error: error)
        }
    }
    
    private func showAlert(on viewController: UIViewController, error: AlertMessage) {
        let alert = UIAlertController(title: error.title.description, message: error.message.description, preferredStyle: .alert)
        
        for button in error.buttons {
            let alertAction = UIAlertAction(title: button.description, style: .default) { [weak self] _ in
                error.actions[button]?()
                self?.lastError = nil
            }
            
            alert.addAction(alertAction)
        }
        viewController.presentOnTop(alert, animated: true)
    }
}
