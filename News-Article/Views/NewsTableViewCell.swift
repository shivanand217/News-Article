//
//  NewsTableViewCell.swift
//  News-Article
//
//  Created by Apple on 19/09/20.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var articleDescription: UILabel!
    @IBOutlet weak var articleImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(news:NewsArticle) {
        DispatchQueue.main.async {
            self.title.text = news.title
            self.articleDescription.text = news.description
        }
    }
    
    func setupImage(image:UIImage) {
        DispatchQueue.main.async {
            self.articleImage.image = image
        }
    }
    
}
