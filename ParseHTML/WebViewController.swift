//
//  WebViewController.swift
//  ParseHTML
//
//  Created by Tony Jung on 2020/11/19.
//

import UIKit
import WebKit

class WebViewController: UIViewController{

    var url: String?
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.navigationDelegate = self
        webView.uiDelegate = self
        
        if let urlString = self.url, let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        
        let button = UIButton(frame: CGRect(x: 300, y: 0, width: 100, height: 100))
        view.addSubview(button)
        button.addTarget(self, action: #selector(testTapped(_:)), for: .touchUpInside)
        button.backgroundColor = .red
        
        var numbers = [String]()
        numbers.append("a")
        numbers.append("b")
        numbers.append("c")
        
        numbers.enumerated().forEach { number in
            number.offset
            print("\(number)")
        }
    }
    
    @objc func testTapped(_ sender: UIButton) {
        webView.configuration.websiteDataStore.httpCookieStore.getAllCookies { cookies in
            cookies.enumerated().forEach { cookie in
                print("\(cookie.offset): \(cookie.element)")
            }
        }
    }
}

extension WebViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        print("### \(navigationAction.request.url)")
        
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        if let currentUrl = webView.url?.absoluteString{
            //absolueString -> String
            print("current URL: \(currentUrl)")
            if currentUrl.contains("noauth") {
                print("--->successful!") //처음에만 로그인시 확인가능
            }
        }
    }
    
    
}

extension WebViewController: WKUIDelegate {
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        //UIDelegate to open new window
        if navigationAction.targetFrame == nil {
            webView.load(navigationAction.request)
        }
        return nil
        
//        let newWebView = WKWebView(frame: webView.frame, configuration: configuration)
//
//        newWebView.navigationDelegate = self
//        newWebView.uiDelegate = self
//        webView.removeFromSuperview()
//        newWebView.load(navigationAction.request)
//        view.addSubview(newWebView)
//
//        return newWebView
    }
}
