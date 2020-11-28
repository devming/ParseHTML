//
//  ViewController.swift
//  ParseHTML
//
//  Created by Tony Jung on 2020/11/19.
//

import UIKit
import SwiftSoup

class LoginViewController: UIViewController {
    
    @IBOutlet weak var kakaoButton: UIButton!
    
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
                vc.url = "https://mtour.interpark.com/MyPage.aspx?mbn=tourmobile&mln=m_main_mypage"
            case 3:
                vc.url = "https://nid.naver.com/nidlogin.login?svctype=262144&amp;url=http://m.naver.com/aside/"
            default: break
            }
            present(vc, animated: true)
        }
    }
}

extension LoginViewController {
    
}
