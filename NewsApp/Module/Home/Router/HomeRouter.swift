//
//  HomeRouter.swift
//  NewsApp
//
//  Created by bagasstb on 31/05/21.
//

import UIKit

class HomeRouter {

    class func loadHomePageComponents(with presenter: HomePresenter) {
        presenter.homeRouter = HomeRouter()
        presenter.homeInteractor = HomeInteractor()
        presenter.homeInteractor?.presenter = presenter
    }
    
    func navigateToNewsDetail(from viewController: UIViewController, news: [News], at index: Int, title: String) {
        if let navigation = viewController.navigationController {
            let newsDetailVC = NewsDetailViewController()
            newsDetailVC.title = LocaleString.newsDetail
            newsDetailVC.newsModel = news
            newsDetailVC.currentIndex = index
            navigation.pushViewController(newsDetailVC, animated: true)
        }
    }
    
    func navigateToFavorite(from navigationController: UINavigationController) {
        let favoriteVC = FavoriteViewController()
        navigationController.pushViewController(favoriteVC, animated: true)
    }
    
}

extension HomeRouter: HomeRouterProtocol {
    
    func showFovorite(from navigationController: UINavigationController) {
        navigateToFavorite(from: navigationController)
    }
    
    func showLogin() {
        
    }
    
    func showErrorAlert(from viewController: UIViewController, with message: String) {
        viewController.showErrorAlert(title: LocaleString.dataNotFound, message: message)
    }
    
    func showNewsDetail(from viewController: UIViewController, news: [News], index: Int, title: String) {
        navigateToNewsDetail(from: viewController, news: news, at: index, title: title)
    }

}
