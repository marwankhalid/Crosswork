//
//  ViewController.swift
//  Crosswork
//
//  Created by Marwan Khalid on 2/7/22.
//

import UIKit
import AVFoundation

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
    @IBOutlet weak var playVIdeoB: UIButton!
    @IBOutlet weak var videoThumbnailI: UIImageView!
    
    private var lastContentOffset: CGFloat = 0
    var menuOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setDesign()
        setupGesture()
        scrollViewContentheight.constant = 920
        if let thumbnailImage = getThumbnailImage(forUrl: URL(string: Constant.videoUrl)!) {
            videoThumbnailI.image = thumbnailImage
            videoThumbnailI.contentMode = .scaleToFill
        }
        playVIdeoB.layer.cornerRadius = playVIdeoB.frame.width / 2
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
    
    @IBAction func playVideoB(_ sender: Any) {
        
    }
    
    @objc func tapSearch(){
        pushToWebVC(url: URL(string: Constant.search)!, title: "Search")
    }
    
    @objc func tapMeet(){
        pushToWebVC(url: URL(string: Constant.meet), title: "Meet")
    }
    
    @objc func tapInvestInMidasFund(){
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
        appearance.backgroundColor = #colorLiteral(red: 0.1568627059, green: 0.1568627059, blue: 0.1568627059, alpha: 1)
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
        pushToWebVC(url: URL(string: Constant.invest)!, title: "Invest")
    }
    
    @IBAction func bookMeeting(_ sender: Any) {
        pushToWebVC(url: URL(string: Constant.meet)!, title: "Book A Meeting")
    }
    
    @IBAction func menuB(_ sender: Any) {
        if !self.menuOpen {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.menuHeight.constant = 250
                self.menuOpen = true
                self.scrollViewContentheight.constant = 1180
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
    
    func getThumbnailImage(forUrl url: URL) -> UIImage? {
        let asset: AVAsset = AVAsset(url: url)
        let imageGenerator = AVAssetImageGenerator(asset: asset)

        do {
            let thumbnailImage = try imageGenerator.copyCGImage(at: CMTimeMake(value: 1, timescale: 60), actualTime: nil)
            return UIImage(cgImage: thumbnailImage)
        } catch let error {
            print(error)
        }

        return nil
    }
    
}

