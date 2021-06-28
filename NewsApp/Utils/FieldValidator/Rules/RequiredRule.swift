//
//  RequiredRule.swift
//  NewsApp
//
//  Created by Sekolahmu on 14/06/21.
//

import Foundation

open class RequiredRule: Rule {
    
    private var message: String
    
    init(message: String = "Required") {
        self.message = message
    }
    
    func isValid(value: String) -> Bool {
        return !value.isEmpty
    }
    
    func errorMessage() -> String {
        return message
    }
}
