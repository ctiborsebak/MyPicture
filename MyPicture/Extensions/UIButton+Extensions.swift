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
        self.titleLabel?.text = buttonText
        self.layer.cornerRadius = 30
        self.backgroundColor = UIColor.skyBlue
    }
    
}
