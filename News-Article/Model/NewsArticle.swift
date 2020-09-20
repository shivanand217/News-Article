//
//  Article.swift
//  News-Article
//
//  Created by Apple on 19/09/20.
//

import Foundation

struct NewsArticle:Codable, Equatable {
    
    private enum CodingKeys: String, CodingKey{
        case author
        case title
        case description
        case url
        case urlToImage
        case publishedAt
    }
    
    static func <= (lhs: NewsArticle, rhs: NewsArticle) -> Bool {
        return lhs.publishedAt! <= rhs.publishedAt!
    }

    var title:String?
    var author:String?
    var description:String?
    var url:String?
    var urlToImage:String?
    var publishedAt:String?
    
    init(author:String, title:String, description:String, url:String, urlToImage:String, publishedAt:String){
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        author = try container.decodeIfPresent(String.self, forKey: .author) ?? ""
        title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        url = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
        urlToImage = try container.decodeIfPresent(String.self, forKey: .urlToImage) ?? ""
        publishedAt = try container.decodeIfPresent(String.self, forKey: .publishedAt) ?? ""
    }
}
