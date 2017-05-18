//
//  ViewController.swift
//  SwipeCell
//
//  Created by suckerl on 2017/5/18.
//  Copyright © 2017年 suckerl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    fileprivate lazy var tableView :UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.bounces = false
        tableView.register(Cell.classForCoder(), forCellReuseIdentifier: ViewController.cellID)
        return tableView
    }()
    
    
    static let cellID = "cell"
    
    //mock数据源
    let data = [
        cellItem(image:"1" , name:" Tracy McGrady") ,
        cellItem(image:"2" , name:" Kobe Bryant") ,
        cellItem(image:"3" , name:" Michael Jordan") ,
        cellItem(image:"4" , name:" Lebron James") ,
        cellItem(image:"5" , name:" Dwight Howard") ,
        cellItem(image:"6" , name:" Jeremy Lin") ,
        cellItem(image:"7" , name:" Kevin Durant") ,
        cellItem(image:"8" , name:" Steven Curry") ,
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }


}

extension ViewController : UITableViewDelegate , UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ViewController.cellID) as! Cell
        cell.selectionStyle = .none
        
        let item = data[indexPath.row]
        
        cell.imageIcon.image = UIImage(named: item.image)
        cell.nameLabel.text = item.name
        return cell
    }
    
    //添加滑动细节
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let share = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "分享") { (row, indexPath) in
            print("share")
        }
//        share.backgroundColor = UIColor.red
        
        let cancle = UITableViewRowAction(style: UITableViewRowActionStyle.normal, title: "取消") { (row, indexPath) in
            print("cancle")
        }
//        cancle.backgroundColor = UIColor.orange
        
        let delete = UITableViewRowAction(style: UITableViewRowActionStyle.destructive, title: "删除") { (row, indexpath) in
            print("delete")
        }
//        delete.backgroundColor = UIColor.gray
        let effect = UIVisualEffect()
        delete.backgroundEffect = effect
        return [share,cancle,delete]
    }
}

extension ViewController {

    func setupUI() {
        tableView.frame = view.bounds
        view.addSubview(tableView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

