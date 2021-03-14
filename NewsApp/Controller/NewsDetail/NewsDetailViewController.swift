//
//  NewsDetailViewController.swift
//  NewsApp
//
//  Created by bagasstb on 14/03/21.
//

import UIKit

class NewsDetailViewController: UIViewController {

    @IBOutlet weak var newsDetailCollectionView: UICollectionView!
    
    var url: String = ""
    var newsModel: [News] = []
    var currentIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
}

extension NewsDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        newsModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsDetailCollectionViewCell.cellIdentifier, for: indexPath) as! NewsDetailCollectionViewCell
        let news = newsModel[indexPath.row]
        let newsDetailViewModel = NewsDetailViewModel(news: news)
        cell.setData(with: newsDetailViewModel)
        return cell
    }
    
}
