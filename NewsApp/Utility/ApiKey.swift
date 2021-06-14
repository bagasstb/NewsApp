//
//  ApiKey.swift
//  NewsApp
//
//  Created by bagasstb on 14/03/21.
//

import UIKit

struct ApiKey {

    static func getApiKey() -> String? {
        if let apiKey = Bundle.main.infoDictionary?["NYT_KEY"] as? String {
            return apiKey
        } else {
            return nil
        }
    }
}
