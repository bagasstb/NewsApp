//
//  HomePresenter.swift
//  NewsApp
//
//  Created by bagasstb on 31/05/21.
//

import Foundation

class HomePresenter: HomeViewProtocol {

    var homeInteractor: HomeInteractor?
    var homeView: ViewController?
    var homeRouter: HomeRouter?
    
    func viewDidLoad() {
        HomeRouter.loadHomePageComponents(with: self)
    }

    func fetchNews() {
        homeView?.newsTableView.isHidden = true
        homeView?.activityIndicatorView.startAnimating()
        homeInteractor?.fetchNews()
    }

    func fetchNewsCache() {
        homeInteractor?.fetchNewsCache()
    }
    
    func didNewsSelect(news: [News], index: Int, title: String) {
        if let homeView = homeView {
            homeRouter?.navigateToNewsDetail(from: homeView, news: news, index: index, title: title)
        }
    }
    
}

extension HomePresenter: HomeInteractorOutputProtocol {
    
    func newsCacheDidFetch(news: NewsList?, errorMessage: String?) {
        homeView?.updateNewsCacheList(news: news, errorMessage: "no data")
    }

    func newsDidFetch(news: NewsList?, errorMessage: String?) {
        homeView?.activityIndicatorView.stopAnimating()
        homeView?.newsTableView.isHidden = false
        homeView?.updateNewsList(news: news, errorMessage: errorMessage)
    }

}
