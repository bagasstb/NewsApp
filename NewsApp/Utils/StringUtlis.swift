//
//  StringUtlis.swift
//  NewsApp
//
//  Created by Satrio Teleng Bagaskoro on 28/06/21.
//

import Foundation

extension String {
    
    func localized() -> String {
        return NSLocalizedString(
            self,
            tableName: "Localizable",
            bundle: .main,
            value: self,
            comment: self)
    }
}
