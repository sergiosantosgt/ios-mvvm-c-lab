//
//  LocalizedTextField.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 13/04/22.
//

import Foundation
import UIKit

class LocalizedTextField: UITextField {
    @IBInspectable var placeholderLocalizationKey: String?
    @IBInspectable var upperText: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderWidth = 0.6
        layer.borderColor = Constants.lightColor.cgColor
        layer.cornerRadius = 5
        
        if (placeholder?.hasNonEmptyValue() ?? false) && placeholderLocalizationKey == nil {
            assertionFailure("Translation key not set for \(text ?? "")")
        }
        placeholder = upperText
            ? placeholderLocalizationKey?.localizedUppercase ?? placeholder
            : placeholderLocalizationKey?.localizedCapitalized ?? placeholder
    }
}

