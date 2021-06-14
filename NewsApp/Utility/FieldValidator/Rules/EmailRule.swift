//
//  EmailRule.swift
//  NewsApp
//
//  Created by Sekolahmu on 14/06/21.
//

import Foundation

class EmailRule: Rule {
    
    static let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    private var message: String
    
    init(message: String = "Please input correct email format") {
        self.message = message
    }
    
    func isValid(value: String) -> Bool {
        let pattern = NSPredicate(format: "SELF MATCHES %@", EmailRule.regex)
        return pattern.evaluate(with: value)
    }
    
    func errorMessage() -> String {
        return message
    }
    
}
