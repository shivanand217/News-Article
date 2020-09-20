//
//  CacheManager.swift
//  News-Article
//
//  Created by Apple on 20/09/20.
//

import Foundation
import UIKit

class CacheManager:NSObject {
    
    public static let publicCache:CacheManager = CacheManager()
    let imageCache = NSCache<AnyObject, AnyObject>()
    
    override init() {
        super.init()
    }
}
