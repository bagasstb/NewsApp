//
//  News.swift
//  NewsApp
//
//  Created by bagasstb on 14/03/21.
//

struct NewsList: Decodable {
    
    let results: [News]
}

struct News: Decodable {
    
    let title: String
    let abstract: String
    let section: String
    let url: String
    let byline: String
    let multimedia: [Multimedia]
}

struct Multimedia: Decodable {
    
    let url: String
    let format: String
    let caption: String
    let copyright: String
}
