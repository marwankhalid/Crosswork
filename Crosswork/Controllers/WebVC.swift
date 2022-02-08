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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setWebview()
    }
    
    private func setWebview(){
        webView.load(URLRequest(url: url!))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
}
