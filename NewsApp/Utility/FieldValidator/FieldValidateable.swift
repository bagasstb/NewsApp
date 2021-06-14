//
//  FieldValidateable.swift
//  NewsApp
//
//  Created by Sekolahmu on 14/06/21.
//

import Foundation

protocol FieldValidatable {
    var validationRules: [Rule] { get }
    var validationText: String { get }
}
