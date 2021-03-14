//
//  NewsListTableViewCell.swift
//  NewsApp
//
//  Created by bagasstb on 14/03/21.
//

import UIKit

class NewsListTableViewCell: UITableViewCell {

    static let cellIdentifier = "newsCell"
    @IBOutlet weak var newsTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static func nib() -> UINib {
        return UINib(nibName: "NewsListTableViewCell", bundle: nil)
    }
    
    public func setData(with: NewsViewModel) {
        newsTitleLabel.text = with.title
    }
    
}
