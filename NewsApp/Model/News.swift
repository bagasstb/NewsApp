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
}
