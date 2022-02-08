//
//  WebVC.swift
//  Crosswork
//
//  Created by Marwan Khalid on 2/8/22.
//

import UIKit
import WebKit

class WebVC: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var url:URL?
    var defaultUrl = URL(string: "https://www.google.com")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setWebview()
    }
    
    private func setWebview(){
        if url?.absoluteString == "" {
            webView.load(URLRequest(url: defaultUrl!))
        }else {
            webView.load(URLRequest(url: url ?? defaultUrl!))
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
}
