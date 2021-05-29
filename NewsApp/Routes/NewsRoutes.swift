//
//  NewsRoutes.swift
//  NewsApp
//
//  Created by bagasstb on 14/03/21.
//

struct NewsRoutes {

    static let shared = NewsRoutes()

    private let baseURL = "https://api.nytimes.com/svc/topstories/v2/"

    func getNews(apiKey: String) -> String {
        return "\(baseURL)home.json?api-key=\(apiKey)"
    }

}
