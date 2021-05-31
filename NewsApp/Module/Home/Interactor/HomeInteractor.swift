//
//  HomeInteractor.swift
//  NewsApp
//
//  Created by bagasstb on 31/05/21.
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol {

    var presenter: HomePresenter?

    func fetchNews() {
        NewsServices.shared.fetchNews { [weak self] (newsList, error) in
            guard let `self` = self else { return }
            if error != nil {
                self.presenter?.newsDidFetch(news: nil, errorMessage: error.debugDescription)
            } else {
                self.presenter?.newsDidFetch(news: newsList, errorMessage: nil)
            }
        }
    }

    func fetchNewsCache() {
        if let news = NewsServices.shared.getCache() {
            self.presenter?.newsCacheDidFetch(news: news, errorMessage: nil)
        } else {
            self.presenter?.newsCacheDidFetch(news: nil, errorMessage: "No cache data")
        }
    }
    
}
