//
//  ViewController.swift
//  MyPicture
//
//  Created by Ctibor Šebák on 20/01/2019.
//  Copyright © 2019 Ctibor Šebák. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak private var usernameTextField: UITextField!
    @IBOutlet weak private var passwordTextField: UITextField!
    @IBOutlet weak private var getPictureButton: UIButton!
    @IBOutlet weak private var imageView: UIImageView!
    
    // MARK: - Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGUI()
    }
    
    fileprivate func setupGUI() {
        // Initial visual setup of various UI elements
        getPictureButton.applyUIButtonSkyBlueColorPreset(buttonText: "GET PICTURE")
        usernameTextField.applyUITextViewSkyBlueColorPreset(placeholder: "Username")
        passwordTextField.applyUITextViewSkyBlueColorPreset(placeholder: "Password")
    }
    
    // MARK: - User Interaction
    
    @IBAction func getPictureButtonPressed(_ sender: Any) {
        // Attempts to fetch the picture from web service when "GET PICTURE" button is pressed
        usernameTextField.checkForEmpyTextField(viewController: self, alertMessage: "Username cannot be empty")
        passwordTextField.checkForEmpyTextField(viewController: self, alertMessage: "Password cannot be empty")
        let loadingOverlay = LoadingOverlayViewModel()
        loadingOverlay.showOverlay(viewController: self)
        let service = WebService()
        let testVM = UserViewModel(login: usernameTextField.text!, password: passwordTextField.text!)
        service.fetchPicture(userVM: testVM) { (result) in
            if result == "authError" {
                // Login credentials are wrong
                loadingOverlay.hideOverlayView()
                self.presentAlert(message: "Wrong username or password")
            } else if result == "error" {
                // Network error: i.e. not connected to the Internet
                loadingOverlay.hideOverlayView()
                self.presentAlert(message: "Please check your connection")
            } else {
                // Picture successfully fetched
                loadingOverlay.hideOverlayView()
                let parsedResult = result.parse(to: PictureViewModel.self)
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Success!", message: nil, preferredStyle: .alert)
                    self.present(alert, animated: true, completion: {
                        DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
                            alert.dismiss(animated: true, completion: nil)
                        })
                    })
                    let imageString = parsedResult?.getImage()
                    self.imageView.image = imageString?.convertBase64ToImage()
                }
            }
        }
    }
    
    // MARK: - Helper methods
    
    fileprivate func presentAlert(message: String) {
        // Presents an alert with a "Cancel" button after 0.5 seconds delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 , execute: {
            let alertController = UIAlertController(title: "Network Error", message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        })
    }
}
