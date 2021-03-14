//
//  ViewController.swift
//  NewsApp
//
//  Created by bagasstb on 14/03/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var newsTableView: UITableView!
    private let newsModel: [News] = [
        News(title: "News Title1", desciption: "Lorem ipsum dolor sit amet"),
        News(title: "News Title2", desciption: "Lorem ipsum dolor sit amet")
    ]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewInit()
        uiInit()
    }

    private func tableViewInit() {
        newsTableView.register(NewsListTableViewCell.nib(), forCellReuseIdentifier: NewsListTableViewCell.cellIdentifier)
        newsTableView.delegate = self
        newsTableView.dataSource = self
    }
    
    private func uiInit() {
        self.title = "New York Times"
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsListTableViewCell.cellIdentifier, for: indexPath) as! NewsListTableViewCell
        let newsViewModel = NewsViewModel(news: newsModel[indexPath.row])
        cell.setData(with: newsViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newsDetailVC = NewsDetailViewController()
        if let navigation = self.navigationController {
            newsDetailVC.title = newsModel[indexPath.row].title
            navigation.pushViewController(newsDetailVC, animated: true)
        }
    }
    
}
