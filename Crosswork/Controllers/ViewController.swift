//
//  ViewController.swift
//  Crosswork
//
//  Created by Marwan Khalid on 2/7/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchB: UIButton!
    
    @IBOutlet weak var bookMeetingB: UIButton!
    @IBOutlet weak var investB: UIButton!
    @IBOutlet weak var learnMoreB: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setDesign()
    }
    
    private func setDesign(){
        self.investB.layer.borderWidth = 1.0
        self.investB.layer.borderColor = UIColor.white.cgColor
        self.investB.layer.cornerRadius = 12.0
        self.bookMeetingB.layer.borderWidth = 1.0
        self.bookMeetingB.layer.borderColor = UIColor.white.cgColor
        self.learnMoreB.layer.cornerRadius = 12.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
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

    @IBAction func searchB(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "WebVC") as! WebVC
        controller.modalPresentationStyle = .fullScreen
        controller.url = URL(string: Constant.search)
        controller.title = "Search"
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func meetB(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "WebVC") as! WebVC
        controller.modalPresentationStyle = .fullScreen
        controller.url = URL(string: "")
        controller.title = "Search"
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func investMidasFund(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "WebVC") as! WebVC
        controller.modalPresentationStyle = .fullScreen
        controller.url = URL(string: Constant.investInMidasFund)
        controller.title = "Invest In Midas Fund"
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func accessFund(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "WebVC") as! WebVC
        controller.modalPresentationStyle = .fullScreen
        controller.url = URL(string: Constant.accessFund)
        controller.title = "Access Fund"
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
    @IBAction func targetsB(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "WebVC") as! WebVC
        controller.modalPresentationStyle = .fullScreen
        controller.url = URL(string: Constant.targets)
        controller.title = "Targets"
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func hereB(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "WebVC") as! WebVC
        controller.modalPresentationStyle = .fullScreen
        controller.url = URL(string: Constant.here)
        controller.title = "Here"
        self.navigationController?.pushViewController(controller, animated: true)
    }
    @IBAction func learnMoreB(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "WebVC") as! WebVC
        controller.modalPresentationStyle = .fullScreen
        controller.url = URL(string: Constant.learnMore)
        controller.title = "Learn More"
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func investB(_ sender: Any) {
        
    }
    
    @IBAction func bookMeeting(_ sender: Any) {
        
    }
    
}

