//
//  Validator.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 14/04/22.
//

import Foundation

class Validator {
    func validate(text: String, with rules: [Rule]) -> String? {
        return rules.compactMap({ $0.check(text) }).first
    }

//    func validate(input: InputView, with rules: [Rule]) {
//        guard let message = validate(text: input.textField.text ?? "", with: rules) else {
//            input.messageLabel.isHidden = true
//            return
//        }
//
//        input.messageLabel.isHidden = false
//        input.messageLabel.text = message
//    }
}
