//
//  WebViewController.swift
//  DailyNews
//
//  Created by Adebayo Oriyomi on 2019-10-19.
//  Copyright © 2019 Adebayo Oriyomi. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    var url:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        // Do any additional setup after loading the view.
        let myURL = URL(string: url!)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
}

