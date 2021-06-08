//
//  HomeConstruct .swift
//  NewsApp
//
//  Created by bagasstb on 31/05/21.
//

import UIKit

protocol HomeViewProtocol {
    func viewDidLoad()
    func fetchNews()
    func fetchNewsCache()
    func didNewsSelect(at index: Int, title: String)
    func news(at index: Int) -> NewsViewModel?
    func newsCount() -> Int
}

protocol HomeInteractorInputProtocol {
    func fetchNews()
    func fetchNewsCache()
}

protocol HomeInteractorOutputProtocol {
    func newsDidFetch(news: NewsList?)
    func showNewsError(message: String?)
    func newsCacheDidFetch(news: NewsList?, errorMessage: String?)
}

protocol HomeViewInterface {
    func updateNewsList()
}

protocol HomeRouterProtocol {
    func showNewsDetail(from viewController: UIViewController, news: [News], index: Int, title: String)
    func showErrorAlert(from viewController: UIViewController, with message: String)
}
