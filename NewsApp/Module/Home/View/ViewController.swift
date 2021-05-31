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
    private var newsModel: [News] = []
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

    private func showErrorAlert() {
        let alert = UIAlertController(title: LocaleString.networkError,
                                      message: LocaleString.networkErrorMessage,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: LocaleString.okay, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension ViewController: HomePresenterProtocol {
    
    func updateNewsCacheList(news: NewsList?, errorMessage: String?) {
        if let results = news?.results {
            self.newsModel = results
            self.newsTableView.reloadData()
        }
    }
    
    func updateNewsList(news: NewsList?, errorMessage: String?) {
        if let results = news?.results {
            self.newsModel = results
            self.newsTableView.reloadData()
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsListTableViewCell.cellIdentifier,
                                                       for: indexPath) as? NewsListTableViewCell else {
            return UITableViewCell()
        }
        let newsViewModel = NewsViewModel(news: newsModel[indexPath.row])
        cell.setData(with: newsViewModel)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didNewsSelect(news: newsModel, index: indexPath.row, title: LocaleString.newsDetail)
    }

}
