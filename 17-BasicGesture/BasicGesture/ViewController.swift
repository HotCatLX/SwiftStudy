//
//  ViewController.swift
//  BasicGesture
//
//  Created by suckerl on 2017/5/22.
//  Copyright © 2017年 suckel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    fileprivate lazy var image :UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "one")
        image.isUserInteractionEnabled = true
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.swipe()
    }
}

extension ViewController {
    func setupUI() {
        view.addSubview(image)
        image.frame = view.bounds
    }
    
    
    /*
     UITapGestureRecognizer	轻拍手势
     UISwipeGestureRecognizer	轻扫手势
     UILongPressGestureRecognizer	长按手势
     UIPanGestureRecognizer	平移手势
     UIPinchGestureRecognizer	捏合（缩放）手势
     UIRotationGestureRecognizer	旋转手势
     UIScreenEdgePanGestureRecognizer	屏幕边缘平移
     */
    
    
    func swipe()  {
        let  swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeSelector(swipe:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.image.addGestureRecognizer(swipeLeft)
    
        let swipeRight = UISwipeGestureRecognizer(target: self, action:#selector(ViewController.swipeSelector(swipe:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.image.addGestureRecognizer(swipeRight)
    }
    
    
    func swipeSelector(swipe:UISwipeGestureRecognizer) {

        if swipe.direction == UISwipeGestureRecognizerDirection.left {
            let twoVC = TwoController()
            self.show(twoVC, sender: nil)
        }else {
            let threeVC = ThreeController()
            self.show(threeVC, sender: nil)
        }
    }
}

