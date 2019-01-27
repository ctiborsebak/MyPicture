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
    
    public func parse<T>(to type: T.Type) -> T? where T: Decodable {
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
    
    public func convertBase64ToImage() -> UIImage {
        let decodedData = NSData(base64Encoded: self, options: NSData.Base64DecodingOptions(rawValue: 0) )
        let decodedimage = UIImage(data: decodedData! as Data)
        return decodedimage!
    }
    
    // MARK: - SHA1 hashing
    
    func charCodeAt(_ charIndex: Int) -> Int {
        if (self.count > charIndex) {
            let character = String(self[index(startIndex, offsetBy: charIndex)])
            return Int(String(character.unicodeScalars.first!.value))!
        } else {
            return 0
        }
    }
    
    public var sha1: String {
        get {
            return SHA1Hashing().hash(str: self)
        }
    }
}

