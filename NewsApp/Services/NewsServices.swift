//
//  NewsServices.swift
//  NewsApp
//
//  Created by bagasstb on 14/03/21.
//

import Foundation

struct NewsServices {
    
    static let shared = NewsServices()
    
    func fetchNews(completion: @escaping (NewsList?, Error?) -> ()) {
        guard let url = URL(string: getUrlString()) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                print("Failed to fetch courses:", err)
                return
            }
            
            // check response
            
            guard let data = data else { return }
            do {
                let news = try JSONDecoder().decode(NewsList.self, from: data)
                DispatchQueue.main.async {
                    completion(news, nil)
                }
            } catch let jsonErr {
                print("Failed to decode:", jsonErr)
            }
        }.resume()
    }
    
    private func getUrlString() -> String {
        if let apiKey = ApiKey.getApiKey() {
            return NewsRoutes.shared.getNews(apiKey: apiKey)
        } else {
            /// put your own api key
            return NewsRoutes.shared.getNews(apiKey: "")
        }
    }
}
