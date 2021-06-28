//
//  HomeViewController.swift
//  NewsApp
//
//  Created by bagasstb on 09/06/21.
//

import UIKit
import SwiftUI

class HomeViewController: UIViewController {

    @IBOutlet weak var newsTableView: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var infoLabel: UILabel!
    var presenter: HomePresenter = HomePresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewInit()
        uiInit()
        presenter.homeView = self
        presenter.viewDidLoad()
        presenter.fetchNews()
    }

    private func tableViewInit() {
        newsTableView.register(NewsListTableViewCell.nib(),
                               forCellReuseIdentifier: NewsListTableViewCell.cellIdentifier)
        newsTableView.delegate = self
        newsTableView.dataSource = self
    }

    private func uiInit() {
        setNavigationItem()
        self.title = LocaleString.homeTitle
    }

    private func setNavigationItem() {
        let rightItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.bookmarks,
                                     target: self,
                                     action: #selector(navigateToFavorite))
        navigationItem.rightBarButtonItem = rightItem
        
        let leftItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add,
                                     target: self,
                                     action: #selector(navigateToLogin))
        navigationItem.leftBarButtonItem = leftItem
    }
    
    @objc private func navigateToFavorite() {
        presenter.favoriteTouchUpInside()
    }
    
    @objc private func navigateToLogin() {
        presenter.loginTouchUpInside()
    }
}

extension HomeViewController: HomeViewInterface {
    
    func updateNewsList() {
        self.newsTableView.reloadData()
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.newsCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsListTableViewCell.cellIdentifier,
                                                       for: indexPath) as? NewsListTableViewCell else {
            return UITableViewCell()
        }
        if let news = presenter.news(at: indexPath.row) {
            cell.setData(with: news)
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectNews(at: indexPath.row, title: LocaleString.newsDetail)
    }

}

struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
    func makeUIViewController(context: Context) -> UIViewController {
        UINavigationController(rootViewController: HomeViewController())
    }
}

struct HomeViewController_Previews: PreviewProvider {
    
    static var previews: some SwiftUI.View {
        ViewControllerRepresentable()
            .edgesIgnoringSafeArea(.vertical)
//            .colorScheme(.dark)
        //            .environment(\.sizeCategory, ContentSizeCategory.accessibilityExtraExtraExtraLarge)
    }
    
}
