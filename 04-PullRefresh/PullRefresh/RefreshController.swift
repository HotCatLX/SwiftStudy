//
//  RefreshController.swift
//  PullRefresh
//
//  Created by suckerl on 2017/5/11.
//  Copyright © 2017年 suckerl. All rights reserved.
//

import UIKit

class RefreshController: UITableViewController {
    
    let emojiArry = ["😏😏😏", "😂😂😂", "😘😘😘", "😈😈😈", "👊🏻👊🏻👊🏻", "👍🏼👍🏼👍🏼", "🐔🐔🐔"]
    let newArry = ["🌚🌚🌚", "😱😱😱", "😳😳😳", "😄😄😄", "🐶🐶🐶","😪😪😪","🐍🐍🐍"]
    var dataArry = [String]()
    
    static let cellId = "clllID"
    
    var refreshC = UIRefreshControl()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataArry = emojiArry
        
        self.tableView.backgroundColor = UIColor.lightGray
        self.tableView.separatorStyle = .none
        self.tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: RefreshController.cellId)
        
        //refreshControl相关设置
        //refreshControl必须创建为其赋值
        self.refreshControl = refreshC
        self.refreshControl?.addTarget(self, action: #selector(RefreshController.refreshMore), for: .valueChanged)
        self.refreshControl?.backgroundColor = UIColor.black
        let attributes = [NSForegroundColorAttributeName: UIColor.white]
        self.refreshControl?.attributedTitle = NSAttributedString(string: "最近一次加载\(Date())", attributes: attributes)
        self.refreshControl?.tintColor = UIColor.white
    }

}

// MARK: - Table view data source
extension RefreshController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArry.count
    }

     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: RefreshController.cellId, for: indexPath)
        cell.textLabel?.text = self.dataArry[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.backgroundColor = UIColor.darkGray
        cell.selectionStyle = .none
        return cell
     }
}

//MARK:- refresh
extension RefreshController {
    func refreshMore()  {
        dataArry = dataArry + newArry
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }

}
