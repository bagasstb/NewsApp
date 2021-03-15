//
//  News.swift
//  NewsApp
//
//  Created by bagasstb on 14/03/21.
//

struct NewsList: Decodable, Encodable {
    
    var results: [News]
}

struct News: Decodable, Encodable {
    
    let title: String
    let abstract: String
    let section: String
    let url: String
    let byline: String
    let multimedia: [Multimedia]
}

struct Multimedia: Decodable, Encodable {
    
    let url: String
    let format: String
    let caption: String
    let copyright: String
}
