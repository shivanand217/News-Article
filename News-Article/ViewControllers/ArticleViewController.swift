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
    
    var progressView:UIProgressView!
    
    @IBAction func saveArticleAction(_ sender: Any) {
        showAlert()
    }
    
    func showAlert() {
        DispatchQueue.main.async {
            let alertVc:UIAlertController = UIAlertController(title: "Want to save this article?", message: "Tap Yes to save this news article.", preferredStyle: .alert)
            let yesAlertAction = UIAlertAction(title: "Yes", style: .default) { (action) in
                
            }
            let noAlertAction = UIAlertAction(title: "No", style: .default) { (action) in }
            alertVc.addAction(yesAlertAction)
            alertVc.addAction(noAlertAction)
            self.present(alertVc, animated: true, completion: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        
        self.webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        
        loadArticle()
    }

    // Observe value
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            print(self.webView.estimatedProgress)
            self.progressView.progress = Float(self.webView.estimatedProgress);
        }
    }
    
    func loadArticle() {
        let url = URL(string: webViewUrl)!
        webView.load(URLRequest(url: url))
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
    }
}

extension ArticleViewController:WKNavigationDelegate {
    
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
