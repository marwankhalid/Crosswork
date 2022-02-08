//
//  VideoDetailVC.swift
//  Crosswork
//
//  Created by Marwan Khalid on 2/8/22.
//

import UIKit
import AVKit

class VideoDetailVC: UIViewController {
    
    var player: AVPlayer!
    var playerViewController: AVPlayerViewController!

    var playerView:UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        addView()
        
        let url2 = URL(string: Constant.videoUrl)!
        //videoPlay(videoURL: url2)
        addPlayer(videoURLL: url2)
        
    }
    
    private func addView(){
        self.view.addSubview(playerView)
        playerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        playerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        playerView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        playerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.45).isActive = true
    }

    private func addPlayer(videoURLL:URL){
        //let videoURL = URL(string: "https://drive.google.com/file/d/1dF91ALVzAOhVN3E5pGwRJtlkr6uPaFFw/view")
        //let videoU = AVPlayer(url: videoURLL)
        self.player = AVPlayer(url: videoURLL)
        self.playerViewController = AVPlayerViewController()
        playerViewController.player = self.player
        playerViewController.view.frame = self.playerView.frame
        playerViewController.player?.play()
        self.playerView.addSubview(playerViewController.view)
    }
    
    func videoPlay(videoURL:URL){
        let player = AVPlayer(url: videoURL)
        let vc = AVPlayerViewController()
        vc.player = player

        present(vc, animated: true) {
            vc.player?.play()
        }
    }
}
