//
//  DataManager.swift
//  News-Article
//
//  Created by Apple on 19/09/20.
//

import Foundation
import CoreData
import UIKit

class DataManager:NSObject {
    
    static let shared:DataManager = DataManager()
    
    var news:[NewsArticle] = []
    var articleImages:[UIImage?] = []
    
    override init() {
        super.init()
    }
    
    func getArticlesFromApi(completion:@escaping (_ data:[NewsArticle])->()) {
        ApiManager.shared.fetchData { (data, error) in
            
            guard error == nil else {
                completion([])
                return
            }
            
            if let news = data {
                for article in news.articles ?? [] {
                    self.news.append(article)
                }
            }
            completion(self.news)
        }
    }
    
    func getArticlesFromCoreData(entityName:String) -> [NewsArticle] {
        let dict:[NSManagedObject] = CoreDataManager.shared.fetchRecord(entityName: EntityName.article.getEntityName(), predicate: nil, sortDescriptors: nil, fetchLimit: nil)
        let news = self.convertManagedObjectToModel(news: dict)
        return news
    }
    
    func convertManagedObjectToModel(news:[NSManagedObject]) -> [NewsArticle]{
        var dict:[NewsArticle] = []
        for article in news {
            let newArticle = NewsArticle(author: article.value(forKey: "author") as! String, title: article.value(forKey: "title") as! String, description: article.value(forKey: "articleDescription") as! String, url: article.value(forKey: "url") as! String, urlToImage: article.value(forKey: "urlToImage") as! String, publishedAt: article.value(forKey: "publishedAt")  as! String)
            dict.append(newArticle)
        }
        return dict
    }
    
}
