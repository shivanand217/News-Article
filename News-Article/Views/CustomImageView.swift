//
//  CustomImageView.swift
//  News-Article
//
//  Created by Apple on 20/09/20.
//

import Foundation
import UIKit

class CustomImageView: UIImageView {
    
    var imageUrlString:String?
    
    func loadImageUsingUrlString(urlString:String) {
        
        let url = URL(string: urlString)
        DispatchQueue.main.async {
            self.image = nil
        }
        
        let imageCache = CacheManager.publicCache.imageCache
        
        let urlStringAsAnyObject = urlString as AnyObject
        if let imageFromCache = imageCache.object(forKey: urlStringAsAnyObject) as? UIImage {
            if self.imageUrlString == urlString {
                DispatchQueue.main.async {
                    self.image = imageFromCache
                }
            }
            return
        }
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            guard error == nil else {
                print(error.debugDescription)
                return
            }
            
            DispatchQueue.main.async {
                let imageToCache = UIImage(data: data!)
                if self.imageUrlString == urlString {
                    self.image = imageToCache
                }
                
                if let cacheImg = imageToCache {
                    imageCache.setObject(cacheImg, forKey: urlStringAsAnyObject)
                }
            }
            
        }.resume()
    }
}
