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
        DispatchQueue.main.async {
            self.backgroundColor = .none
            self.layer.cornerRadius = 15
            self.layer.borderWidth = 1
            self.layer.borderColor = UIColor.white.cgColor
            self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            self.textColor = UIColor.skyBlue
        }
    }
    
    public func checkForEmpyTextFielAndPresentAnErrorIfEmpty(viewController: UIViewController, alertMessage: String) {
        if self.text == "" {
            DispatchQueue.main.async( execute: {
                let alertController = UIAlertController(title: "Error", message: alertMessage, preferredStyle: .alert)
                let action = UIAlertAction(title: "Cancel", style: .default, handler: nil)
                alertController.addAction(action)
                viewController.present(alertController, animated: true, completion: nil)
                return
            })
        }
    }
}
