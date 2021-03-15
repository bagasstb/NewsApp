//
//  NewsDetailViewController.swift
//  NewsApp
//
//  Created by bagasstb on 14/03/21.
//

import UIKit

class NewsDetailViewController: UIViewController {

    @IBOutlet weak var newsDetailCollectionView: UICollectionView!
    
    var newsDetailViewModel: NewsDetailViewModel?
    var currentIndex: Int = 0
    var newsModel: [News] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableInit()
        print("Current index \(currentIndex)")
        
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
}

extension NewsDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        newsModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsDetailCollectionViewCell.cellIdentifier, for: indexPath) as! NewsDetailCollectionViewCell
        let news = newsModel[indexPath.row]
        let newsDetailViewModel = NewsDetailViewModel(news: news)
        cell.setData(with: newsDetailViewModel, vc: self)
        return cell
    }
    
}
