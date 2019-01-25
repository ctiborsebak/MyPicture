//
//  ViewController.swift
//  MyPicture
//
//  Created by Ctibor Šebák on 20/01/2019.
//  Copyright © 2019 Ctibor Šebák. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var getPictureButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPictureButton.applyUIButtonSkyBlueColorPreset(buttonText: "GET PICTURE")
        usernameTextField.applyUITextViewSkyBlueColorPreset(placeholder: "Username")
        passwordTextField.applyUITextViewSkyBlueColorPreset(placeholder: "Password")
    }
    
    // MARK: - User Interaction
    
    @IBAction func getPictureButtonPressed(_ sender: Any) {
       let loadingOverlay = LoadingOverlay()
       loadingOverlay.showOverlay(viewController: self)
        let service = WebService()
        let testVM = UserViewModel(login: "sebak", password: "ctibor")
        service.fetchPicture(userVM: testVM) { (result) in
            if result == "authError" {
                loadingOverlay.hideOverlayView()
                self.presentAlert(message: "Wrong username or password")
            } else if result == "error" {
                loadingOverlay.hideOverlayView()
                self.presentAlert(message: "Please ensure that you are connected to the Internet")
            } else {
                loadingOverlay.hideOverlayView()
                //TODO: JSON parsing
                 print("\(result)")
            }
        }
    }
    
    func presentAlert(message: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 , execute: {
            let alertController = UIAlertController(title: "Network Error", message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        })
        
    }
}
