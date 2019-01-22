//
//  LoadingOverlay.swift
//  MyPicture
//
//  Created by Ctibor Šebák on 21/01/2019.
//  Copyright © 2019 Ctibor Šebák. All rights reserved.
//

import UIKit

public class LoadingOverlay {
    
    var activityIndicator : UIActivityIndicatorView!
    var overlayView: UIAlertController!
    
    init(){
        overlayView = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        activityIndicator.startAnimating()
        overlayView.view.addSubview(activityIndicator)
    }
    
    public func showOverlay(viewController: UIViewController) {
        viewController.present(overlayView, animated: true, completion: nil)
        activityIndicator.startAnimating()
    }
    
    public func hideOverlayView() {
        activityIndicator.stopAnimating()
        overlayView.dismiss(animated: true, completion: nil)
    }
}
