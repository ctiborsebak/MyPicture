//
//  UserViewModel.swift
//  MyPicture
//
//  Created by Ctibor Šebák on 24/01/2019.
//  Copyright © 2019 Ctibor Šebák. All rights reserved.
//

import Foundation

class UserViewModel {
    
    // MARK: - Properties
    
    private var username : String
    private var pass : String
    
    // MARK: - Initialization
    
    init(login: String, password: String) {
        username = login
        let hasher = SHA1Hashing()
        let hashedPW = hasher.hash(str: password)
        pass = hashedPW
    }
    
    // MARK: - Getters
    
    func getUsername() -> String {
        return self.username
    }
    
    func getHashedPassword() -> String {
        return self.pass
    }
    
}
