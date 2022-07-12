//
//  Validation.swift
//  Gifty
//
//  Created by Michael Amiro on 11/07/2022.
//

import UIKit

class Validation {
    static let shared = Validation()

    func isValid(_ value: Any, _ textContextType: UITextContentType) -> Bool {
        switch textContextType {
        case .password:
            print("Password")
            let regex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$")

            return regex.evaluate(with: value as? String)
        default:
            print("default case")
            return true
        }
    }
    
}
