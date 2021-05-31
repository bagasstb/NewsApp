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
    func didNewsSelect(news: [News], index: Int, title: String)
}

protocol HomeInteractorInputProtocol {
    func fetchNews()
    func fetchNewsCache()
}

protocol HomeInteractorOutputProtocol {
    func newsDidFetch(news: NewsList?, errorMessage: String?)
    func newsCacheDidFetch(news: NewsList?, errorMessage: String?)
}

protocol HomePresenterProtocol {
    func updateNewsList(news: NewsList?, errorMessage: String?)
    func updateNewsCacheList(news: NewsList?, errorMessage: String?)
}

protocol HomeRouterProtocol {
    func showNewsDetail(from viewController: UIViewController, news: [News], index: Int, title: String)
}
