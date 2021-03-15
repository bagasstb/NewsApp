//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by bagasstb on 14/03/21.
//

struct NewsViewModel {
    
    let title: String
    let abstract: String
    let section: String
    let url: String
    
    // Dependency Injection
    init(news: News) {
        self.title = news.title
        self.abstract = news.abstract
        self.section = news.section.uppercased()
        self.url = news.url
    }
}
