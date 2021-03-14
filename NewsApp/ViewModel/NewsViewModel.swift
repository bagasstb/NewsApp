//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by bagasstb on 14/03/21.
//

struct NewsViewModel {
    
    let title: String
    
    // Dependency Injection
    init(news: News) {
        self.title = news.title
    }
}
