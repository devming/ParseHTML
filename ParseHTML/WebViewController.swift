//
//  WebViewController.swift
//  ParseHTML
//
//  Created by Tony Jung on 2020/11/19.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    var url: String?
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(url)
       
        if let urlString = self.url, let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    //x만들기

}
