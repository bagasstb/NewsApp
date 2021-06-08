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
    var newsModel: [News] = []
    
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
    
    func didNewsSelect(at index: Int, title: String) {
        if let homeView = homeView {
            homeRouter?.navigateToNewsDetail(from: homeView, news: newsModel, at: index, title: title)
        }
    }
    
    private func showTableView() {
        homeView?.activityIndicatorView.stopAnimating()
        homeView?.newsTableView.isHidden = false
    }
    
    // MARK: - Logic
    func news(at index: Int) -> NewsViewModel? {
        return NewsViewModel(news: newsModel[index])
    }
    
    func newsCount() -> Int {
        return newsModel.count
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    
    func newsDidFetch(news: NewsList?) {
        showTableView()
        if let news = news?.results {
            self.newsModel = news
            homeView?.newsTableView.reloadData()
        }
    }
    
    func showNewsError(message: String?) {
        showTableView()
        if let homeView = homeView {
            homeRouter?.showErrorAlert(from: homeView, with: message ?? "")
        }
    }
    
    func newsCacheDidFetch(news: NewsList?, errorMessage: String?) {
        showTableView()
        homeView?.updateNewsList()
    }

}
