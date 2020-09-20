//
//  Article.swift
//  News-Article
//
//  Created by Apple on 19/09/20.
//

import Foundation

struct NewsArticle:Codable, Equatable {
    
    private enum CodingKeys: String, CodingKey{
//        case source
//        case author
//        case content
        case title
        case description
        case url
        case urlToImage
        case publishedAt
    }
    
    static func <= (lhs: NewsArticle, rhs: NewsArticle) -> Bool {
        return lhs.publishedAt! <= rhs.publishedAt!
    }
    
//    var source:[String:String]?
//    var author:String?
//    var content:String?
    var title:String?
    var description:String?
    var url:String?
    var urlToImage:String?
    var publishedAt:String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
//        source = try container.decodeIfPresent([String:String].self, forKey: .source) ?? [:]
//        author = try container.decodeIfPresent(String.self, forKey: .author) ?? ""
        title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        url = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
        urlToImage = try container.decodeIfPresent(String.self, forKey: .urlToImage) ?? ""
        publishedAt = try container.decodeIfPresent(String.self, forKey: .publishedAt) ?? ""
//        content = try container.decodeIfPresent(String.self, forKey: .content) ?? ""
    }
}
