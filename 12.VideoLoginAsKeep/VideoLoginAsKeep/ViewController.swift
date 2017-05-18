//
//  ViewController.swift
//  VideoLoginAsKeep
//
//  Created by suckerl on 2017/5/17.
//  Copyright © 2017年 suckerl. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit


class ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    
    var player = AVPlayer()
    var playerVC = AVPlayerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 10
        self.dealWithVideoPlay()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        player.play()
    }
    
}

extension ViewController {
    func dealWithVideoPlay() {
     
        guard let urlStr = Bundle.main.path(forResource: "spotify.mp4", ofType: nil) else {
            return
        }
        let url = URL(fileURLWithPath: urlStr)
        
        player = AVPlayer(url: url)
        playerVC.player = player
        playerVC.showsPlaybackControls = false
        
        playerVC.view.frame = view.bounds
        view.insertSubview(playerVC.view, at: 0)
        
        //replay 添加监听
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.repeatPlay(noti:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
    }
    
    
    func repeatPlay(noti : Notification) {
        print("plat end")
        
        //第几秒 ＝ value ／ timescale
        player.seek(to: CMTime(value: 0, timescale: 1))
        player.play()
    }
}

extension ViewController {
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
