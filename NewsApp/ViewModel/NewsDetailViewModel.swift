//
//  NewsDetailViewModel.swift
//  NewsApp
//
//  Created by bagasstb on 15/03/21.
//

import Foundation

struct NewsDetailViewModel {
    
    let title: String
    let description: String
    let photo: String?
    let caption: String?
    
    init(news: News) {
        self.title = news.title
        self.description = news.abstract
        
        if let index = news.multimedia.firstIndex(where: {$0.format == "Normal" }) {
            let data = news.multimedia[index]
            self.photo = data.url
            self.caption = data.caption
        } else {
            self.photo = nil
            self.caption = nil
        }
    }
}
