//
//  MinimumLengthRule.swift
//  NewsApp
//
//  Created by Sekolahmu on 14/06/21.
//

import Foundation

class MinimumLengthRule: Rule {
    
    let minLength = 3
    private var message: String
    
    init(message: String) {
        self.message = message
    }
    
    func isValid(value: String) -> Bool {
        return value.count > 3
    }
    
    func errorMessage() -> String {
        return message
    }
    
}
