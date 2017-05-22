//
//  TwoController.swift
//  BasicGesture
//
//  Created by suckerl on 2017/5/22.
//  Copyright © 2017年 suckel. All rights reserved.
//

import UIKit

class TwoController: UIViewController {

    fileprivate lazy var image :UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "two")
        image.isUserInteractionEnabled = true
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.tap()
    }
}

extension TwoController {
    func setupUI() {
        view.addSubview(image)
        image.frame = view.bounds
    }
    
    func tap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(TwoController.tapSelector))
        tap.numberOfTapsRequired = 1
        image.addGestureRecognizer(tap)
    }
    
    func tapSelector() {
        let vc = ViewController()
        self.show(vc, sender: nil)
        
    }
}
