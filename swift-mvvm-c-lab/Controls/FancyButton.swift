//
//  FancyButton.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 13/04/22.
//

import Foundation
import UIKit

@IBDesignable
class FancyButton: UIButton {
    
    public var fancyButtonColor: UIColor = Constants.mainColor
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    override open var isEnabled: Bool {
        didSet {
            alpha = isEnabled ? 1.0 : 0.4
        }
    }
    
    override open var isHighlighted: Bool {
        didSet {
            setBackgroundColor()
        }
    }
    
    override var buttonType: UIButton.ButtonType {
        return UIButton.ButtonType.custom
    }
    
    override var contentEdgeInsets: UIEdgeInsets {
        get {
            return UIEdgeInsets(top: 9, left: 40, bottom: 9, right: 40)
        }
        
        set {}
    }
    
    var highlightedColor: UIColor {
        return fancyButtonColor
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setUpView()
    }
    
    private func setUpView() {
        cornerRadius = 10
        borderWidth = 1
        borderColor = fancyButtonColor
        
        setTitleColor(UIColor.white, for: .highlighted)
        alpha = isEnabled ? 1.0 : 0.3
        setBackgroundColor()
        
        layoutIfNeeded()
    }
    
    private func setBackgroundColor() {
        backgroundColor = isHighlighted
            ? highlightedColor
            : UIColor.clear
    }
    
    public func setCustomColor(color: UIColor) {
        fancyButtonColor = color
        borderColor = color
        setTitleColor(color, for: .normal)
    }
}

