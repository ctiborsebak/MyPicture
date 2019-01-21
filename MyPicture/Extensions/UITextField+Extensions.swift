//
//  UITextField+Extensions.swift
//  MyPicture
//
//  Created by Ctibor Šebák on 20/01/2019.
//  Copyright © 2019 Ctibor Šebák. All rights reserved.
//

import UIKit

extension UITextField {
    
    func applyLoginViewControllerColorPreset(placeholder: String) {
        self.backgroundColor = .none
        self.layer.cornerRadius = 30
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.skyBlue.cgColor
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        self.textColor = UIColor.skyBlue
    }
    
}
