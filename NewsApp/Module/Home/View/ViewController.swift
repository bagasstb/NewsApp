//
//  ViewController.swift
//  NewsApp
//
//  Created by bagasstb on 14/03/21.
//

import UIKit

class ViewController: UIViewController {

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
        self.title = LocaleString.homeTitle
        let button = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.bookmarks,
                                     target: self,
                                     action: #selector(navigateToFavorite))
        navigationItem.rightBarButtonItem = button
    }

    @objc private func navigateToFavorite() {
        if let navigation = self.navigationController {
            let favoriteVC = FavoriteViewController()
            navigation.pushViewController(favoriteVC, animated: true)
        }
    }
    
}

extension ViewController: HomeViewInterface {
    
    func updateNewsList() {
        self.newsTableView.reloadData()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

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
        presenter.didNewsSelect(at: indexPath.row, title: LocaleString.newsDetail)
    }

}
