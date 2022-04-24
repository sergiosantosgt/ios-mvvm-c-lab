//
//  SecondaryTextField.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 24/04/22.
//

import Foundation
import UIKit

class SecondaryTextField: UITextField {
    @IBInspectable var placeholderLocalizationKey: String?
    @IBInspectable var upperText: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if (placeholder?.hasNonEmptyValue() ?? false) && placeholderLocalizationKey == nil {
            assertionFailure("Translation key not set for \(text ?? "")")
        }
        placeholder = upperText
            ? placeholderLocalizationKey?.localizedUppercase ?? placeholder
            : placeholderLocalizationKey?.localizedCapitalized ?? placeholder
    }
}
