//
//  ViewController.swift
//  Player
//
//  Created by suckerl on 2017/5/15.
//  Copyright © 2017年 suckerl. All rights reserved.
//

import UIKit
import SnapKit
import AVFoundation

class ViewController: UIViewController {

    fileprivate lazy var bgImage :UIImageView = {
        let bgImage = UIImageView()
        bgImage.image = UIImage(named: "图2")
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.prominent)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.bounds
        bgImage.addSubview(blurEffectView)
        return bgImage
    }()
    
    fileprivate lazy var icon :UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "bg")
        return icon
    }()
    
    fileprivate lazy var nameLabel :UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "ALL Alone"
        nameLabel.textColor = UIColor.darkGray
        nameLabel.textAlignment = .center
        return nameLabel
    }()
    
    fileprivate lazy var lyricLabel :UILabel = {
        let lyricLabel = UILabel()
        lyricLabel.text = "FUN."
        lyricLabel.textColor = UIColor.darkGray
        lyricLabel.textAlignment = .center
        return lyricLabel
    }()
    
    fileprivate lazy var runButton :UIButton = {
        let runButton = UIButton()
        runButton.setImage(UIImage(named: "stop"), for: .normal)
        runButton.setImage(UIImage(named: "player"), for: .selected)
        runButton.addTarget(self, action: #selector(ViewController.videoButtonClick(btn:)), for: .touchUpInside)
        return runButton
    }()
    
    
    var playerr = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.playMusic()
    }
    
    
    
    func playMusic()  {
        let path = URL(fileURLWithPath: Bundle.main.path(forResource: "Fun. - All Alone.mp3", ofType: nil)!)
        do {
            try
                playerr = AVAudioPlayer(contentsOf: path)

        } catch let playError as NSError {
           
            print(playError)
        }
    }
}

extension ViewController {
    func setupUI() {
        view.insertSubview(bgImage, at: 0)
        view.addSubview(icon)
        view.addSubview(nameLabel)
        view.addSubview(lyricLabel)
        view.addSubview(runButton)
        
        self.constructLayut()
    }
    
    func constructLayut()  {
        bgImage.snp.makeConstraints { (make) in
            make.left.right.width.height.equalTo(self.view)
        }
        
        icon.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view).offset(100)
            make.width.height.equalTo(150)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(icon.snp.bottom).offset(100)
            make.centerX.equalTo(self.view)
            make.height.equalTo(30)
            make.width.equalTo(100)
        }
        
        lyricLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(30)
            make.centerX.equalTo(self.view)
            make.height.equalTo(30)
            make.width.equalTo(100)
        }
        
        runButton.snp.makeConstraints { (make) in
            make.top.equalTo(lyricLabel.snp.bottom).offset(30)
            make.centerX.equalTo(self.view)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
    }
}

//MARK:- 播放按钮点击
extension ViewController {

    func videoButtonClick(btn : UIButton)  {
     btn.isSelected = !btn.isSelected
        
        if btn.isSelected {
        //播放
            playerr.play()
        }else {
        //暂停
            playerr.pause()
            print(playerr.deviceCurrentTime)
        }

    }
}

