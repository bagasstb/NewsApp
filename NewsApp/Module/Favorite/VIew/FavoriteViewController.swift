//
//  FavoriteViewController.swift
//  NewsApp
//
//  Created by bagasstb on 15/03/21.
//

import UIKit

class FavoriteViewController: UIViewController {

    @IBOutlet weak var favTableView: UITableView!
    private var newsModel: [News] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewInit()
        fetchData()
    }

    private func tableViewInit() {
        favTableView.register(NewsListTableViewCell.nib(), forCellReuseIdentifier: NewsListTableViewCell.cellIdentifier)
        favTableView.delegate = self
        favTableView.dataSource = self
    }

    private func fetchData() {
        if let favorite = NewsServices.shared.getFavoriteNews() {
            self.newsModel = favorite.results
        } else {
            // handle no data
        }
    }

    private func showEmptyAlert() {
        let alert = UIAlertController(title: LocaleString.dataNotFound,
                                      message: LocaleString.dataNotFoundMessage,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: LocaleString.okay, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource {

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
        let newsDetailVC = NewsDetailViewController()
        if let navigation = self.navigationController {
            newsDetailVC.title = LocaleString.newsDetail
            newsDetailVC.newsModel = self.newsModel
            newsDetailVC.currentIndex = indexPath.row
            navigation.pushViewController(newsDetailVC, animated: true)
        }
    }

}
