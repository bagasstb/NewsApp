//
//  Rule.swift
//  NewsApp
//
//  Created by Sekolahmu on 14/06/21.
//

import Foundation

protocol Rule {
    func isValid(value: String) -> Bool
    func errorMessage() -> String
}
