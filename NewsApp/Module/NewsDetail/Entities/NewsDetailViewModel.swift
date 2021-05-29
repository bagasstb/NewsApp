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
    let url: String

    init(news: News) {
        self.title = news.title
        self.description = news.abstract
        self.url = news.url

        if let index = news.multimedia.firstIndex(where: {$0.format == ImageType.mediumThreeByTwo210.rawValue }) {
            let multimedia = news.multimedia[index]
            self.photo = multimedia.url
            if multimedia.copyright == "" {
                self.caption = "\(multimedia.caption)"
            } else {
                self.caption = "\(multimedia.caption) by, \(multimedia.copyright)"
            }

        } else {
            self.photo = nil
            self.caption = nil
        }
    }
}

enum ImageType: String {

    case superJumbo = "superJumbo"
    case standardThumbnail = "Standard Thumbnail"
    case thumbLarge = "thumbLarge"
    case mediumThreeByTwo210 = "mediumThreeByTwo210"
    case normal = "Normal"

}
