//
//  ViewController.swift
//  Timer
//
//  Created by suckerl on 2017/5/10.
//  Copyright © 2017年 suckerl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var resertButton: UIButton!
    
    var timer = Timer()
    var isRun = false
    var timerNumer = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.setTitleColor(UIColor.lightGray, for: UIControlState.disabled)
        cancelButton.setTitleColor(UIColor.lightGray, for: UIControlState.disabled)
        resertButton.setTitleColor(UIColor.lightGray, for: UIControlState.disabled)
        
        cancelButton.isEnabled = false
        resertButton.isEnabled = false
    }

//MARK:- 事件处理
    @IBAction func startButtonClick(_ sender: Any) {
        cancelButton.isEnabled = true
        resertButton.isEnabled = true
        
        if isRun == true {
            return
        }else {
            timer = Timer(timeInterval: 0.1, target: self, selector:#selector(ViewController.timerChange) , userInfo: nil, repeats: true)
            RunLoop.main.add(timer, forMode: RunLoopMode.commonModes)
            self.isRun = true
        }
    }

    @IBAction func cancleButtonClick(_ sender: Any) {
        timer.invalidate()
        cancelButton.isEnabled = false
        isRun = false
    }
    
    
    @IBAction func resertButtonClick(_ sender: UIButton) {
        timer.invalidate()
        timerNumer = 0.0
        timerLabel.text = "0.0"
        cancelButton.isEnabled = false
        sender.isEnabled = false
        isRun = false
    }
}

extension ViewController {
    func timerChange()  {
        timerNumer += 0.1
        timerLabel.text = String(format: "%.1f", timerNumer)
    }

}

