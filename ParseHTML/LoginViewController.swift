//
//  ViewController.swift
//  ParseHTML
//
//  Created by Tony Jung on 2020/11/19.
//

import UIKit
import SwiftSoup

class LoginViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func login(_ sender: UIButton) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as? WebViewController {
            
            switch sender.tag {
            case 0:
                vc.url = "https://www.goodchoice.kr/user/login"
            case 1:
                vc.url = "https://m.hanatour.com/com/lgi/CHPC0LGI0106M100"
            case 2:
                vc.url = "https://tour.interpark.com/gate/Login.aspx?_method=initial&mbn=tour&mln=login&goUrl=https%3A//tour.interpark.com/airticket/domestic/main.aspx%3Fgclid%3DCjwKCAiAzNj9BRBDEiwAPsL0d0e3w600NLF_lk1oDh1X4BKpG1Zg3hA4XY_7tIWvy7ZNJnQAcqTD3BoCwkAQAvD_BwE"
            case 3:
                vc.url = "https://nid.naver.com/nidlogin.login?svctype=262144&amp;url=http://m.naver.com/aside/"
            default: break
            }
            
            
            present(vc, animated: true)
        }
    }
  
}

