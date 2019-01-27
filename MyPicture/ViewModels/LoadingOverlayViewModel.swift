//
//  LoadingOverlay.swift
//  MyPicture
//
//  Created by Ctibor Šebák on 21/01/2019.
//  Copyright © 2019 Ctibor Šebák. All rights reserved.
//

import UIKit

class LoadingOverlayViewModel {
    
    // MARK: - Properties
    
    private var activityIndicator : UIActivityIndicatorView!
    private var overlayView: UIAlertController!
    
    // MARK: - Initialization
    
    init(){
        overlayView = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        activityIndicator.startAnimating()
        overlayView.view.addSubview(activityIndicator)
    }
    
    // MARK: - Operating Methods
    
    func showOverlay(viewController: UIViewController) {
        // Presents the loading overlay
        DispatchQueue.main.async {
            viewController.present(self.overlayView, animated: true, completion: nil)
            self.activityIndicator.startAnimating()
        }
    }
    
    func hideOverlayView() {
        // Dismisses the loading overlay from view hierarchy
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.overlayView.dismiss(animated: false, completion: nil)
        }
    }
}
