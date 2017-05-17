//
//  ViewController.swift
//  LayerTest
//
//  Created by suckerl on 2017/5/17.
//  Copyright © 2017年 suckerl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    fileprivate lazy var imageBG :UIImageView = {
        let imageBG = UIImageView()
        imageBG.image = UIImage.init(named: "图2")
        return imageBG
    }()
    
    var effect = UIBlurEffect(style: UIBlurEffectStyle.dark)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageBG)
        imageBG.frame = view.bounds
        
        let effectView = UIVisualEffectView(effect: effect)
        effectView.frame = view.bounds
        effectView.alpha = 0.5
        imageBG.addSubview(effectView)

        
    }
}

