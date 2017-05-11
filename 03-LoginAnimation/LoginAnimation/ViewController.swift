//
//  ViewController.swift
//  LoginAnimation
//
//  Created by suckerl on 2017/5/11.
//  Copyright © 2017年 suckerl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @IBAction func loginClick(_ sender: UIButton) {
        let loginVC = LoginController()
        let nav = UINavigationController(rootViewController: loginVC)
        self.show(nav, sender: nil)
    }
    


}

