//
//  ViewController.swift
//  MyPicture
//
//  Created by Ctibor Šebák on 20/01/2019.
//  Copyright © 2019 Ctibor Šebák. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - Properties
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK: - Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.applyLoginViewControllerColorPreset(placeholder: "Username")
        passwordTextField.applyLoginViewControllerColorPreset(placeholder: "Password")
    }


    @IBAction func getPictureButtonPressed(_ sender: Any) {
        LoadingOverlay().showOverlay(viewController: self)
    }
}

