//
//  WebService.swift
//  MyPicture
//
//  Created by Ctibor Šebák on 22/01/2019.
//  Copyright © 2019 Ctibor Šebák. All rights reserved.
//

import Foundation
import UIKit

final class WebService {
    
    func fetchPictureWithRequest(request: URLRequest, completion: @escaping ((String) -> Void)) {
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                // Check for fundamental networking error
                print("Networking error: \(error)")
                completion("error")
                return
            }
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                // Check for http errors
                if httpStatus.statusCode == 401 {
                    completion("authError")
                    return
                } else {
                    print("The HTTP status should be 200, but is: \(httpStatus.statusCode)")
                    completion("error")
                    return
                }
            }
            if let responseString = String(data: data, encoding: .utf8) {
                completion(responseString)
            } else {
                completion("error")
                return
            }
        }
        task.resume()
    }

    func createPostRequest(url: String, content_type: String, userVM: UserViewModel) -> URLRequest {
        let urlAsUrl = URL(string: url)!
        var request = URLRequest(url: urlAsUrl)
        request.setValue(content_type, forHTTPHeaderField: "Content-Type")
        request.setValue("\(userVM.getHashedPassword())", forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"
        let postString = "username=\(userVM.getUsername())"
        request.httpBody = postString.data(using: .utf8)
        return request
    }

}

