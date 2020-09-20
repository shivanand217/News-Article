////
////  URLCacheManager.swift
////  News-Article
////
////  Created by Apple on 20/09/20.
////
//
//import Foundation
//import WebKit
//
//class URLCacheManager {
//
//static let timeout: TimeInterval = 120
//static var requestPaths = [String]()
//
//class func startRequest(for url: URL, completionWithErrorCallback: @escaping (_ error: Error?) -> Void) {
//
//    let urlRequest = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: timeout)
//
//    WebSe
//    WebService.sendCachingRequest(for: urlRequest) { (response) in
//
//        if let error = response.error {
//            DDLogError("Error: \(error.localizedDescription) from cache response url: \(String(describing: response.request?.url))")
//        }
//        else if let _ = response.data,
//            let _ = response.response,
//            let request = response.request,
//            response.error == nil {
//
//            guard let cacheResponse = urlCache.cachedResponse(for: request) else { return }
//
//            urlCache.storeCachedResponse(cacheResponse, for: request)
//        }
//    }
//}
//class func startCachingImageURLs(_ urls: [URL]) {
//
//    let imageURLs = urls.filter { $0.pathExtension.contains("png") }
//
//    let prefetcher = ImagePrefetcher.init(urls: imageURLs, options: nil, progressBlock: nil, completionHandler: { (skipped, failed, completed) in
//        DDLogError("Skipped resources: \(skipped.count)\nFailed: \(failed.count)\nCompleted: \(completed.count)")
//    })
//
//    prefetcher.start()
//}
//
//class func startCachingPageURLs(_ urls: [URL]) {
//    let pageURLs = urls.filter { !$0.pathExtension.contains("png") }
//
//    for url in pageURLs {
//
//        DispatchQueue.main.async {
//            startRequest(for: url, completionWithErrorCallback: { (error) in
//
//                if let error = error {
//                    DDLogError("There was an error while caching request: \(url) - \(error.localizedDescription)")
//                }
//
//            })
//        }
//    }
//}
//}
