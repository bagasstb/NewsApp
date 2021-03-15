//
//  NewsDetailViewController.swift
//  NewsApp
//
//  Created by bagasstb on 14/03/21.
//

import UIKit

class NewsDetailViewController: UIViewController {

    @IBOutlet weak var newsDetailCollectionView: UICollectionView!
    
    var currentIndex: Int = 0
    var newsModel: [News] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableInit()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        newsDetailCollectionView.isPagingEnabled = false
        newsDetailCollectionView.scrollToItem(at: getIndex(index: currentIndex), at: .right, animated: true)
        newsDetailCollectionView.isPagingEnabled = true
    }
    
    private func tableInit() {
        newsDetailCollectionView.register(NewsDetailCollectionViewCell.nib(), forCellWithReuseIdentifier: NewsDetailCollectionViewCell.cellIdentifier)
        newsDetailCollectionView.delegate = self
        newsDetailCollectionView.dataSource = self
        newsDetailCollectionView.collectionViewLayout = setFlowLayout()
       
    }
    
    private func setFlowLayout() -> UICollectionViewFlowLayout {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let screen: CGRect = UIScreen.main.bounds
        layout.itemSize = CGSize(width: screen.width, height: screen.height)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        return layout
    }
    
    private func getIndex(index: Int) -> IndexPath {
        return IndexPath.init(item: index, section: 0)
    }
    
    private func showFavSuccessAlert() {
        let alert = UIAlertController(title: LocaleString.addedToFavorite, message: LocaleString.addedToFavoriteMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: LocaleString.ok, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension NewsDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        newsModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsDetailCollectionViewCell.cellIdentifier, for: indexPath) as! NewsDetailCollectionViewCell
        let news = newsModel[indexPath.row]
        let newsDetailViewModel = NewsDetailViewModel(news: news)
        cell.setData(with: newsDetailViewModel, shareActionHandler: shareNews, favActionHandler: addToFavorite)
        return cell
    }
    
    private func shareNews() {
        let url = newsModel[currentIndex].url
        if let url = URL(string: "nytapp://url=\(url)") {
            let items = [url]
            let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
            self.present(ac, animated: true)
        }
    }
    
    private func addToFavorite() {
        NewsServices.shared.setFavoriteNews(news: newsModel[currentIndex])
        showFavSuccessAlert()
    }
}
