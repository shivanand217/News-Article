//
//  CacheManager.swift
//  News-Article
//
//  Created by Apple on 20/09/20.
//

import Foundation
import UIKit

extension UIImageView {
    
    func loadImageUsingUrlString(urlString:String) {
        
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            // blank image
            self.image = nil
            
            guard error == nil else {
                print(error.debugDescription)
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }
    }
}

class CacheManager:NSObject {
    
    public static let publicCache:CacheManager = CacheManager()
    
    var cache:NSCache<AnyObject, AnyObject>!
    
    override init() {
        super.init()
    }
    
    
}
