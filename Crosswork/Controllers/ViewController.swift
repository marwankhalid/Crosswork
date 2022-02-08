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
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func setupNavigationBar(){
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        //appearance.backgroundColor = #colorLiteral(red: 0.06475532055, green: 0.6011719108, blue: 0.553545773, alpha: 1)
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }

    @IBAction func searchB(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "WebVC") as! WebVC
        controller.modalPresentationStyle = .fullScreen
        controller.url = URL(string: "https://crosswork.us/pre-ipo-selected-targets")
        controller.title = "Search"
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}

