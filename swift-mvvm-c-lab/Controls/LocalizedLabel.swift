//
//  LocalizedLabel.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 13/04/22.
//

import Foundation
import UIKit

class LocalizedLabel: UILabel {
    @IBInspectable var localizationKey: String?
    @IBInspectable var upperText: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if localizationKey == nil {
            assertionFailure("Translation key not set for \(text ?? "")")
        }
        text = upperText ? localizationKey?.localizedUppercase : localizationKey?.localizedCapitalized
    }
}
