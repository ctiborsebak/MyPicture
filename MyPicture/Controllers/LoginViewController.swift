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
    @IBOutlet weak var getPictureButton: UIButton!
    
    //MARK: - Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPictureButton.applyUIButtonSkyBlueColorPreset(buttonText: "GET PICTURE")
        usernameTextField.applyUITextViewSkyBlueColorPreset(placeholder: "Username")
        passwordTextField.applyUITextViewSkyBlueColorPreset(placeholder: "Password")
        let service = WebService()
        service.fetchPicture(username: "sebak", password: "ctibor")
    }

    @IBAction func getPictureButtonPressed(_ sender: Any) {
//        let loadingOverlay = LoadingOverlay()
//        loadingOverlay.showOverlay(viewController: self)
    }
}
