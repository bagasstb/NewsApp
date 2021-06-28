//
//  UserDefaultUtils.swift
//  NewsApp
//
//  Created by bagasstb on 15/03/21.
//

import Foundation

extension UserDefaults {

    func getNews(forKey defaultName: String) -> NewsList? {
        guard let data = data(forKey: defaultName) else { return nil }
        do {
            return try JSONDecoder().decode(NewsList.self, from: data)
        } catch { print("save cache error \(error)"); return nil }
    }

    func setNews(_ value: NewsList, forKey defaultName: String) {
        let data = try? JSONEncoder().encode(value)
        set(data, forKey: defaultName)
    }

}
