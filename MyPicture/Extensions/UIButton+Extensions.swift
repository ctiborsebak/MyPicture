//
//  UIButton+Extensions.swift
//  MyPicture
//
//  Created by Ctibor Šebák on 22/01/2019.
//  Copyright © 2019 Ctibor Šebák. All rights reserved.
//

import UIKit

extension UIButton {
    
    public func applyUIButtonSkyBlueColorPreset(buttonText: String) {
        // Applies preset color scheme and visual tweaks to the UIButton
        self.titleLabel?.text = buttonText
        self.layer.cornerRadius = 15
        self.backgroundColor = UIColor.skyBlue
    }
    
}
