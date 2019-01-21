//
//  LoadingAlert.swift
//  MyPicture
//
//  Created by Ctibor Šebák on 21/01/2019.
//  Copyright © 2019 Ctibor Šebák. All rights reserved.
//

import UIKit

class LoadingAlert: UIAlertController {
    
    override func viewDidLoad() {
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.whiteLarge
        loadingIndicator.startAnimating()
        
        alert.view.addSubview(loadingIndicator)
    }
    
}
