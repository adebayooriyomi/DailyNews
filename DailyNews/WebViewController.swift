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
        webView.load(url!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension WKWebView {
    func load(_ urlString: String) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            load(request)
        }
    }
}
