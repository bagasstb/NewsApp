//
//  NewsDetailCollectionViewCell.swift
//  NewsApp
//
//  Created by bagasstb on 14/03/21.
//

import UIKit
import Kingfisher

class NewsDetailCollectionViewCell: UICollectionViewCell {

    static let cellIdentifier = "newsDetailCell"
    private var vc: UIViewController? = nil
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var captionLabel: UILabel!
    
    private var news: NewsDetailViewModel? = nil {
        didSet {
            /// notify data changed
            titleLabel.text = news?.title
            descriptionLabel.text = news?.description
            newsImageView.kf.setImage(with: URL(string: news?.photo ?? ""))
            captionLabel.text = news?.caption
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        uiInit()
    }

    private func uiInit() {
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        captionLabel.font = UIFont.systemFont(ofSize: 14)
        shareButton.backgroundColor = .link
        shareButton.setTitleColor(.white, for: .normal)
        shareButton.makeCircleCorner()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "NewsDetailCollectionViewCell", bundle: nil)
    }
    
    public func setData(with: NewsDetailViewModel, vc: UIViewController) {
        self.news = with
        self.vc = vc
    }
    
    @IBAction func shareButtonTouchUpInside(_ sender: UIButton) {
        if let urlString = news?.url, let url = URL(string: urlString) {
            let items = [url]
            let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
            vc?.present(ac, animated: true)
        }
    }
    
}
