//
//  DateController.swift
//  DateAndTime
//
//  Created by suckerl on 2017/5/19.
//  Copyright © 2017年 suckerl. All rights reserved.
//

import UIKit
import SnapKit

class DateController: UIViewController {
    
    //    回调
    var result : ((String) -> Void)?
    var formatter = DateFormatter()
    
    
    fileprivate lazy var time :UIDatePicker = {
        let time = UIDatePicker()
        time.datePickerMode = .time
        time.locale = Locale(identifier: "zh")
        return time
    }()
    
    fileprivate lazy var date :UIDatePicker = {
        let date = UIDatePicker()
        date.datePickerMode = .date
        return date
    }()
    
    fileprivate lazy var resuleLabel :UILabel = {
        let resuleLabel = UILabel()
        resuleLabel.backgroundColor = UIColor.orange
        resuleLabel.layer.cornerRadius = 8
        resuleLabel.clipsToBounds = true
        resuleLabel.textAlignment  = .center
        resuleLabel.textColor = UIColor.white
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd' at 'HH:mm"
        resuleLabel.text = "Now:\(formatter.string(from: date))"
        return resuleLabel
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNav()
        self.setupUI()
        view.backgroundColor = UIColor.lightGray
    }
}


//MARK:- setupNav
extension DateController {
    func setupNav() {
        self.title = "设置时间和日期"
        let left = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(DateController.leftItemClick))
        self.navigationItem.leftBarButtonItem = left
        
        let right = UIBarButtonItem(title: "完成", style: .done, target: self, action: #selector(DateController.rightItemClick))
        self.navigationItem.rightBarButtonItem = right
    }
    
    func leftItemClick() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func rightItemClick() {

        formatter.dateStyle = .full
        let dateS = formatter.string(from: date.date)
        
        formatter.timeStyle = .short
        formatter.dateStyle = .none
        let timeS = formatter.string(from: time.date)
        
        
        let resultString = dateS + " " + timeS

        self.result!(resultString)
        
        self.dismiss(animated: true) {
            
        }
    }
}



//MARK:- setupUI
extension DateController {
    func setupUI() {
        view.addSubview(resuleLabel)
        view.addSubview(time)
        view.addSubview(date)
        self.constructLayOut()
    }
    
    func constructLayOut() {
        resuleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(100)
            make.centerX.equalTo(view)
            make.width.equalTo(200)
            make.height.equalTo(30)
        }
        
        date.snp.makeConstraints { (make) in
            make.top.equalTo(resuleLabel.snp.bottom).offset(30)
            make.left.equalTo(50)
            make.right.equalTo(-50)
            make.height.equalTo(150)
        }
        
        time.snp.makeConstraints { (make) in
            make.top.equalTo(date.snp.bottom).offset(30)
            make.left.equalTo(50)
            make.right.equalTo(-50)
            make.height.equalTo(date)
        }
    }
}

