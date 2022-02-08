//
//  ViewController.swift
//  Crosswork
//
//  Created by Marwan Khalid on 2/7/22.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var searchL: UILabel!
    
    @IBOutlet weak var scrollViewContentheight: NSLayoutConstraint!
    @IBOutlet weak var meetL: UILabel!
    
    @IBOutlet weak var investInMidasFundL: UILabel!
    
    @IBOutlet weak var accessFundL: UILabel!
    
    @IBOutlet weak var bookMeetingB: UIButton!
    @IBOutlet weak var investB: UIButton!
    @IBOutlet weak var learnMoreB: UIButton!
    
    @IBOutlet weak var targetsL: UILabel!
    @IBOutlet weak var hereL: UILabel!
    
    @IBOutlet weak var menuHeight: NSLayoutConstraint!
    
    @IBOutlet weak var menuB: UIButton!
    
    private var lastContentOffset: CGFloat = 0

    var menuOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setDesign()
        setupGesture()
        scrollViewContentheight.constant = 920
        
    }
    
    private func setDesign(){
        self.investB.layer.borderWidth = 1.0
        self.investB.layer.borderColor = UIColor.white.cgColor
        self.investB.layer.cornerRadius = 12.0
        self.bookMeetingB.layer.borderWidth = 1.0
        self.bookMeetingB.layer.borderColor = UIColor.white.cgColor
        self.bookMeetingB.layer.cornerRadius = 12.0
        self.learnMoreB.layer.cornerRadius = 12.0
    }
    
    private func setupGesture(){
        searchL.isUserInteractionEnabled = true
        meetL.isUserInteractionEnabled = true
        investInMidasFundL.isUserInteractionEnabled = true
        accessFundL.isUserInteractionEnabled = true
        targetsL.isUserInteractionEnabled = true
        hereL.isUserInteractionEnabled = true
        self.searchL.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapSearch)))
        self.meetL.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapMeet)))
        self.investInMidasFundL.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapInvestInMidasFund)))
        self.accessFundL.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAccessFund)))
        self.targetsL.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapTargets)))
        self.hereL.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapHere)))
    }
    
    @objc func tapSearch(){
        pushToWebVC(url: URL(string: Constant.search)!, title: "Search")
    }
    
    @objc func tapMeet(){
        pushToWebVC(url: URL(string: Constant.meet), title: "Meet")
    }
    
    @objc func tapInvestInMidasFund() {
        pushToWebVC(url: URL(string: Constant.investInMidasFund)!, title: "INvest In MIdas Fund")
    }
    
    @objc func tapAccessFund(){
        pushToWebVC(url: URL(string: Constant.accessFund)!, title: "Access Fund")
    }
    
    @objc func tapTargets(){
        pushToWebVC(url: URL(string: Constant.targets)!, title: "Targets")
    }
    
    @objc func tapHere(){
        pushToWebVC(url: URL(string: Constant.here)!, title: "Here")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.menuHeight.constant = 0
    }
    
    private func setupNavigationBar(){
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = #colorLiteral(red: 0.1792391241, green: 0.2248817384, blue: 0.2625262439, alpha: 1)
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    private func pushToWebVC(url:URL?,title:String) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "WebVC") as! WebVC
        controller.modalPresentationStyle = .fullScreen
        controller.url = url
        controller.title = title
        self.navigationController?.pushViewController(controller, animated: true)
    }

    @IBAction func learnMoreB(_ sender: Any) {
        pushToWebVC(url: URL(string: Constant.learnMore)!, title: "Learn More")
    }
    
    @IBAction func investB(_ sender: Any) {
        
    }
    
    @IBAction func bookMeeting(_ sender: Any) {
        
    }
    
    @IBAction func menuB(_ sender: Any) {
        if !self.menuOpen {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.menuHeight.constant = 250
                self.menuOpen = true
                self.scrollViewContentheight.constant = 1200
            }, completion: nil)
        }else {
            self.menuHeight.constant = 0
            self.menuOpen = false
            self.scrollViewContentheight.constant = 920
        }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        print(self.scrollView.contentOffset.y)
        if (self.lastContentOffset > scrollView.contentOffset.y) {
            // move up
            print("UP")
        }
        else if (self.lastContentOffset < scrollView.contentOffset.y) {
           // move down
            self.menuHeight.constant = 0
            self.menuOpen = false
            print("Hello")
        }
        self.menuHeight.constant = 0
        self.menuOpen = false
        // update the new position acquired
        self.lastContentOffset = scrollView.contentOffset.y
    }
    
}

