//
//  ApiManager.swift
//  News-Article
//
//  Created by Apple on 19/09/20.
//

import Foundation
import UIKit

typealias apiCompletionHandler = (News?, Error?) -> Void
typealias apiCompletionHandler2 = (UIImage?, Error?) -> Void

let newsApi = "https://moedemo-93e2e.firebaseapp.com/assignment/NewsApp/articles.json"

enum Urls {
    case articles
    func getUrl() -> String {
        switch self {
        case .articles:
            return newsApi
        }
    }
}

class ApiManager:NSObject {
    
    static let shared:ApiManager = ApiManager()
    var session:URLSession = URLSession.shared
    
    override init() {
        super.init()
    }
    
    func fetchData(completionBlock:@escaping apiCompletionHandler) {
        
        let defaultSession = URLSession(configuration: .default)
        var dataTask: URLSessionDataTask?
        
        dataTask?.cancel()
            
        if let urlComponents = URLComponents(string: Urls.articles.getUrl()) {
            
          guard let url = urlComponents.url else {
            return
          }
          
          dataTask =
            defaultSession.dataTask(with: url) { [weak self] (data, response, error) in
                
            if let error = error {
                completionBlock(nil, error)
                return
            } else if
              let data = data,
              let response = response as? HTTPURLResponse,
                
                response.statusCode == 200 {
                    do {
                        let res = try JSONDecoder().decode(News.self, from: data)
                        DispatchQueue.main.async {
                            completionBlock(res, error)
                            return
                        }
                    } catch let error as NSError {
                        print("Decode Error: \(error.debugDescription)")
                        completionBlock(nil, error)
                        return
                    }
                }
                DispatchQueue.main.async {
                    completionBlock(nil, error)
                    return
                }
          }
            
          dataTask?.resume()
        }
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(_ url: URL,_ completionBlock:@escaping apiCompletionHandler2) {
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else {
                completionBlock(nil, error)
                return
            }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() {
                completionBlock(UIImage(data: data), error)
            }
        }
    }
    
}
