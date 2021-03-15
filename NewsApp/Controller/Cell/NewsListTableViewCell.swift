//
//  NewsListTableViewCell.swift
//  NewsApp
//
//  Created by bagasstb on 14/03/21.
//

import UIKit

class NewsListTableViewCell: UITableViewCell {

    static let cellIdentifier = "newsCell"
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var abstractLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    private func setUI() {
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        dateLabel.font = UIFont.systemFont(ofSize: 12)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "NewsListTableViewCell", bundle: nil)
    }
    
    public func setData(with: NewsViewModel) {
        titleLabel.text = with.title
        abstractLabel.text = with.abstract
        dateLabel.text = with.section
    }
    
}
