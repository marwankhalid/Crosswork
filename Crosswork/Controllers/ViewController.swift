//
//  ViewController.swift
//  Crosswork
//
//  Created by Marwan Khalid on 2/7/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchB: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
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
        controller.title = "Invest In Midas Fund"
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}

