//
//  ViewController.swift
//  Fonts
//
//  Created by suckerl on 2017/5/10.
//  Copyright © 2017年 suckerl. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
   static let cellID = "cell"
    
   fileprivate lazy var topView : UIView = {
        let topView = UIView()
        topView.backgroundColor = UIColor.black
        return topView
    }()
    
    fileprivate lazy var topLabel : UILabel = {
        let topLabel = UILabel()
        topLabel.text = "Custom Font"
        topLabel.textColor = UIColor.white
        topLabel.textAlignment = NSTextAlignment.center
        return topLabel
    }()
    
    fileprivate lazy var middleTabView : UITableView = {
        let middleTabView = UITableView(frame: CGRect.zero, style: UITableViewStyle.plain)
        middleTabView.dataSource = self as UITableViewDataSource
        middleTabView.delegate = self as UITableViewDelegate
        middleTabView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: ViewController.cellID)
        return middleTabView
    }()
    
    fileprivate lazy  var bottomView : UIView = {
        let bottomView = UIView()
        bottomView.backgroundColor = UIColor.black
        return bottomView
    }()
    
    fileprivate lazy var bottomButton : UIButton = {
        let bottomButton = UIButton()
        bottomButton.setTitle("Custom Font", for: UIControlState.normal)
        bottomButton.setTitleColor(UIColor.darkGray, for: UIControlState.normal)
        bottomButton.backgroundColor = UIColor.yellow
        bottomButton.addTarget(self, action: #selector(ViewController.bottomClick), for: UIControlEvents.touchUpInside)
        return bottomButton
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(topView)
        view.addSubview(topLabel)
        view.addSubview(middleTabView)
        view.addSubview(bottomView)
        view.addSubview(bottomButton)
        
        self.constructLayout()
    }
}

//MARK:- dataSource & delegat
extension ViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier:ViewController.cellID, for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
}

//MARK:- 处理点击事件
extension ViewController {
    func bottomClick()  {
        
    }

}

//MARK:- constructLayout
extension ViewController {
    func constructLayout()  {
        topView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view)
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            make.height.equalTo(80)
        }
        
        topLabel.snp.makeConstraints { (make) in
            make.center.equalTo(topView)
            make.width.equalTo(200)
            make.height.equalTo(60)
        }
        
        bottomView.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view)
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            make.height.equalTo(160)
        }
        
        bottomButton.snp.makeConstraints { (make) in
            make.center.equalTo(bottomView)
            make.width.equalTo(120)
            make.height.equalTo(120)
        }
        bottomButton.layer.cornerRadius = 60
        
        middleTabView.snp.makeConstraints { (make) in
            make.bottom.equalTo(bottomView.snp.top)
            make.top.equalTo(topView.snp.bottom)
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
        }
    }
    
}
