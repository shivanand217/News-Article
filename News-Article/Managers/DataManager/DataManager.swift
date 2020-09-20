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
            if let news = data {
                for article in news.articles ?? [] {
                    self.news.append(article)
                }
            }
            completion(self.news)
        }
    }
    
    func getArticlesFromCoreData(entityName:String, completion:@escaping (_ data:[NewsArticle])->()) {
        
        let dict:[String:String] = CoreDataManager.shared.fetchRecord(entityName: EntityName.article.getEntityName(), predicate: nil, sortDescriptors: nil, fetchLimit: nil)
    }
}
