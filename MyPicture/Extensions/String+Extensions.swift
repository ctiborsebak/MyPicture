//
//  String+Extensions.swift
//  MyPicture
//
//  Created by Ctibor Šebák on 26/01/2019.
//  Copyright © 2019 Ctibor Šebák. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func parse<T>(to type: T.Type) -> T? where T: Decodable {
        // Parses the retrieved data into the given type, could have also been implemented as a standalone class
        let data: Data = self.data(using: .utf8)!
        let decoder = JSONDecoder()
        do {
            let _object = try decoder.decode(type, from: data)
            return _object
        } catch {
            return nil
        }
    }
    
    func convertBase64ToImage() -> UIImage {
        // Converts base64 String into UIImage
        let decodedData = NSData(base64Encoded: self, options: NSData.Base64DecodingOptions(rawValue: 0) )
        let decodedimage = UIImage(data: decodedData! as Data)
        return decodedimage!
    }

}

