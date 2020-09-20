//
//  ArticleViewController.swift
//  News-Article
//
//  Created by Apple on 19/09/20.
//

import UIKit
import WebKit

class ArticleViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var webViewUrl:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        loadArticle()
    }
    
    override func loadView() {
        super.loadView()
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    func loadArticle() {
        // urls in json are http that's why UrlSession not able t
        let url = URL(string: "https://www.youtube.com/news")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
}

extension ArticleViewController:WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        var action: WKNavigationActionPolicy?

        defer {
            decisionHandler(action ?? .allow)
        }

        guard let url = navigationAction.request.url else { return }
        print("decidePolicyFor - url: \(url)")

        //Uncomment below code if you want to open URL in safari
//        if navigationAction.navigationType == .linkActivated, url.absoluteString.hasPrefix("https://developer.apple.com/") {
//            action = .cancel  // Stop in WebView
//            UIApplication.shared.open(url)
//        }
    }
    
    //Equivalent of webViewDidStartLoad:
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("didStartProvisionalNavigation - webView.url: \(String(describing: webView.url?.description))")
    }
    
    //Equivalent of didFailLoadWithError:
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        let nserror = error as NSError
        if nserror.code != NSURLErrorCancelled {
            webView.loadHTMLString("Page Not Found", baseURL: URL(string: "https://developer.apple.com/"))
        }
    }
    
    //Equivalent of webViewDidFinishLoad:
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("didFinish - webView.url: \(String(describing: webView.url?.description))")
    }
}
