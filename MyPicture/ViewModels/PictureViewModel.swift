//
//  PictureViewModel.swift
//  MyPicture
//
//  Created by Ctibor Šebák on 26/01/2019.
//  Copyright © 2019 Ctibor Šebák. All rights reserved.
//

import Foundation

struct PictureViewModel: Codable {
    
    // MARK: - Properties
    
    private var image: String
    
    // MARK: - Getter
    
    func getImage() -> String {
        return self.image
    }
}
