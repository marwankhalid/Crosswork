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
    var refController:UIRefreshControl = UIRefreshControl()
    private lazy var loadingIndicator: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.color = .black
        spinner.style = .large
        return spinner
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setWebview()
        swipeRefresh()
        setupIndicator()
    }
    
    private func swipeRefresh(){
        refController.bounds = CGRect(x: 0, y: 50, width: refController.bounds.size.width, height: refController.bounds.size.height)
        refController.addTarget(self, action: #selector(reloadWebView(_:)), for: .valueChanged)
        refController.attributedTitle = NSAttributedString(string: "")
        webView.scrollView.addSubview(refController)
    }
    
    @objc func reloadWebView(_ sender: UIRefreshControl){
        webView.reload()
        refController.endRefreshing()
    }
    
    func showActivityIndicator(show: Bool) {
        if show {
            loadingIndicator.startAnimating()
        } else {
            loadingIndicator.stopAnimating()
        }
    }
    
    private func setupIndicator(){
        self.view.addSubview(loadingIndicator)
        self.loadingIndicator.widthAnchor.constraint(equalToConstant: 40).isActive = true
        self.loadingIndicator.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.loadingIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.loadingIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    private func setWebview(){
        webView.navigationDelegate = self
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

extension WebVC:WKNavigationDelegate,WKUIDelegate {
    func webView(_ webView: WKWebView, didFinish navigation:WKNavigation!) {
        showActivityIndicator(show: false)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        showActivityIndicator(show: true)
    }
    
    func webView(_ webView: WKWebView, didFail navigation:WKNavigation!, withError error: Error) {
        showActivityIndicator(show: false)
    }
}
