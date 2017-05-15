//
//  ViewController.swift
//  PikerViewStud
//
//  Created by suckerl on 2017/5/12.
//  Copyright © 2017年 suckerl. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController  {

    
    var imageArray = [String]()
    var dataArray1 = [Int]()
    var dataArray2 = [Int]()
    var dataArray3 = [Int]()
    
    fileprivate lazy var picker :UIPickerView = {
        let picker = UIPickerView()
        picker.dataSource = self
        picker.delegate = self
        return picker
    }()
    
    fileprivate lazy var goButton :UIButton = {
        let goButton = UIButton()
        goButton.layer.cornerRadius = 8
        goButton.backgroundColor = UIColor.orange
        goButton .setTitle("GO", for: .normal)
        goButton.setTitleColor(UIColor.white, for: .normal)
        goButton.addTarget(self, action: #selector(ViewController.goButtonClick), for: .touchUpInside)
        return goButton
    }()
    
    fileprivate lazy var resultLabel :UILabel = {
        let resultLabel = UILabel()
        resultLabel.textColor = UIColor.white
        resultLabel.backgroundColor = UIColor.lightGray
        resultLabel.layer.cornerRadius = 8
        resultLabel.text = ""
        resultLabel.textAlignment = .center
        return resultLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(picker)
        view.addSubview(goButton)
        view.addSubview(resultLabel)
        self.constructLayout()
        
        
        imageArray = ["🐶", "🐼", "🐵", "🐸", "🐮", "🐲", "🐯", "🐰", "🐹", "🐭"]
        for _ in 0 ..< 100 {
            dataArray1.append((Int)(arc4random() % 10))
            dataArray2.append((Int)(arc4random() % 10))
            dataArray3.append((Int)(arc4random() % 10))
        }
    }
}

//MARK:- UIPickerViewDelegate,UIPickerViewDataSource
extension ViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50.0
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let emojiLabel = UILabel()
        if (component == 0) {
            emojiLabel.text = imageArray[(Int)(dataArray1[row])]
        } else if (component == 1) {
            emojiLabel.text = imageArray[(Int)(dataArray2[row])]
        } else {
            emojiLabel.text = imageArray[(Int)(dataArray3[row])]
        }
        
        emojiLabel.font = UIFont(name: "Apple Color Emoji", size: 40)
        emojiLabel.textAlignment = .center
        
        return emojiLabel
    }
}


extension ViewController {
    func constructLayout() {
        picker.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(50)
            make.left.equalTo(self.view).offset(50)
            make.right.equalTo(self.view).offset(-50)
            make.height.equalTo(200)
        }
    
        goButton.snp.makeConstraints { (make) in
            make.top.equalTo(picker.snp.bottom).offset(180)
            make.centerX.equalTo(self.view)
            make.height.equalTo(30)
            make.width.equalTo(100)
        }
        
        
        resultLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view).offset(-100)
            make.centerX.equalTo(self.view)
            make.height.equalTo(30)
            make.width.equalTo(200)
        }
    }
}

extension ViewController {
    func goButtonClick() {
        //随机
        picker.selectRow(Int(arc4random()) % 9 + 3, inComponent: 0, animated: true)
        picker.selectRow(Int(arc4random()) % 9 + 3, inComponent: 1, animated: true)
        picker.selectRow(Int(arc4random()) % 9 + 3, inComponent: 2, animated: true)
    }
    
    
}

