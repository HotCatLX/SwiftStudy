//
//  ViewController.swift
//  DJPlayer
//
//  Created by suckerl on 2017/5/16.
//  Copyright © 2017年 suckerl. All rights reserved.
//

import UIKit
import SnapKit
import AVFoundation

class ViewController: UIViewController {

    var player = AVPlayer()
    
    var timer = Timer()
    
    //渐变色层
    var gradientColorLayer = CAGradientLayer()
    
    fileprivate lazy var startButton :UIButton = {
        let startButton = UIButton()
        startButton.setImage(UIImage.init(named: "music play"), for: .normal)
        startButton.addTarget(self, action: #selector(startButtonClick), for: .touchUpInside)
        return startButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }

  }

//MARK:- UI
extension ViewController {
    func setupUI() {
        view.backgroundColor = UIColor.yellow
        view.addSubview(startButton)
        
        //设置渐变色层
        gradientColorLayer.frame = view.bounds
        let color1 = UIColor(white: 0.5, alpha: 0.2).cgColor as CGColor
        let color2 = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.4).cgColor as CGColor
        let color3 = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.3).cgColor as CGColor
        let color4 = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 0.3).cgColor as CGColor
        let color5 = UIColor(white: 0.4, alpha: 0.5).cgColor as CGColor
        
        //colors 必须是cgColor
        
        gradientColorLayer.colors = [color1, color2, color3, color4, color5]
        gradientColorLayer.locations = [0.1,0.3,0.5,0.7,0.9]
        gradientColorLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientColorLayer.endPoint = CGPoint(x: 1, y: 1)
        view.layer.addSublayer(gradientColorLayer)
        
        self.constructLayout()
    }
    
    func constructLayout() {
        startButton.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.width.height.equalTo(100)
        }
    }
}

//MARK:- 播放
extension ViewController {
    func startButtonClick() {
        self.playMusic()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.changeBG), userInfo: nil, repeats: true)
    }

    func playMusic() {
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "Alan Walker - Fade.mp3", ofType: nil)!)
        player = AVPlayer(url: url)
        player.play()
        /*
         AVAudioPlayer - 只能播放本地音频,不支持流媒体播放,适用方便,能设置较多参数
         - 分配播放所需的资源，并将其加入内部播放队列 [player prepareToPlay]
         - 能设置较多参数更灵活
         
         AVPlyer - 支持本地和流媒体的音频的播放,但是提供接口较少,不够灵活
         */
    }
    
    
    //drand48() 返回[0,1]之间均匀分布的随机数 double

    func changeBG() {
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        
        view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 0.7)
    }
}


