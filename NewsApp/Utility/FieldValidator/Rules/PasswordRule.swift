//
//  PasswordRule.swift
//  NewsApp
//
//  Created by Sekolahmu on 14/06/21.
//

import Foundation

class PasswordRule: Rule {
    
    static let regex = "^.{6,12}$"
    private let message: String
    
    init(message: String = "Must be between 6 and 12 characters") {
        self.message = message
    }
    
    func isValid(value: String) -> Bool {
        let pattern = NSPredicate(format: "SELF MATCHES %@", PasswordRule.regex)
        return pattern.evaluate(with: value)
    }
    
    func errorMessage() -> String {
        return message
    }
    
}
