//
//  UITextField+Extensions.swift
//  MyPicture
//
//  Created by Ctibor Šebák on 20/01/2019.
//  Copyright © 2019 Ctibor Šebák. All rights reserved.
//

import UIKit

extension UITextField {
    
    public func applyUITextViewSkyBlueColorPreset(placeholder: String) {
        // Applies preset color scheme and visual tweaks to the UITextField
        self.backgroundColor = .none
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        self.textColor = UIColor.skyBlue
    }
    
}
