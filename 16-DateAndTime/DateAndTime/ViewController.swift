//
//  ViewController.swift
//  DateAndTime
//
//  Created by suckerl on 2017/5/19.
//  Copyright © 2017年 suckerl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resuleLabel: UILabel!
    
    @IBOutlet weak var setButton: UIButton!
    
    //用于存储返回的数据
    var date = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButton.layer.cornerRadius = 8
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("date : \(date)")
        resuleLabel.text = date
    }
    
    
    
    @IBAction func settingDateClick(_ sender: UIButton) {
    
        let dateVC = DateController()
        let nav = UINavigationController(rootViewController: dateVC)
        dateVC.result = ({ string in
            
            self.date = string
            print("string : \(string)")
        })

        self.show(nav, sender: nil)
    }
}

