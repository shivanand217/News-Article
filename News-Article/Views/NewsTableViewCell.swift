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
    @IBOutlet weak var articleImage: CustomImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(news:NewsArticle) {
        DispatchQueue.main.async {
            self.title.text = news.title
            self.articleDescription.text = news.description
            self.articleImage.imageUrlString = news.urlToImage
            self.articleImage.loadImageUsingUrlString(urlString: news.urlToImage!)
        }
    }
    
}
