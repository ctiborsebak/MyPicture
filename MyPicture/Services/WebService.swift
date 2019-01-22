//
//  WebService.swift
//  MyPicture
//
//  Created by Ctibor Šebák on 22/01/2019.
//  Copyright © 2019 Ctibor Šebák. All rights reserved.
//

import Foundation

final class WebService {
    
    func fetchPicture(username: String, password: String) {
        let url = URL(string: "https://mobility.cleverlance.com/download/bootcamp/image.php")!
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        let hashing = SHA1Hashing()
        let hashedPW = hashing.hash(str: password)
        request.setValue("\(hashedPW)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"
        let postString = "username=\(username)"
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(error)")
                return
            }
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(responseString)")
            print(request.allHTTPHeaderFields)
            print("\(request.httpBody)")
        }
        task.resume()
    }
    
}
