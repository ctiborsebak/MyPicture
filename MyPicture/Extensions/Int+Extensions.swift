//
//  Int+Extensions.swift
//  MyPicture
//
//  Created by Ctibor Šebák on 26/01/2019.
//  Copyright © 2019 Ctibor Šebák. All rights reserved.
//

import Foundation

// MARK: - SHA1 hashing

extension Int {
    func toString(_ i: Int) -> String {
        if (i == 16) {// hexadecimal
            return String(format: "%2X", self)
                .lowercased()
                .replacingOccurrences(of: " ", with: "")
        }
        else if (i == 8) {// octal
            return String(self, radix: 8, uppercase: false)
                .lowercased()
                .replacingOccurrences(of: " ", with: "")
        }
        else if (i == 2) {// binary
            return String(self, radix: 2, uppercase: false)
                .lowercased()
                .replacingOccurrences(of: " ", with: "")
        }
        else {
            return String(self)
        }
    }
}
