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
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        uiInit()
    }

    private func uiInit() {
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "NewsDetailCollectionViewCell", bundle: nil)
    }
    
    public func setData(with: NewsDetailViewModel) {
        titleLabel.text = with.title
        descriptionLabel.text = with.description
        newsImageView.kf.setImage(with: URL(string: with.photo ?? ""))
    }
}
