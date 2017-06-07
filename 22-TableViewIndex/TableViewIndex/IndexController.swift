//
//  IndexController.swift
//  TableViewIndex
//
//  Created by suckerl on 2017/6/6.
//  Copyright © 2017年 suckerl. All rights reserved.
//

import UIKit

class IndexController: UIViewController {

    static let cellID = "CELL"
    
    var headers = ["A", "B", "C", "D", "E","F","G","H"]
    
    var data = [ ["Amy", "Alice", "Antony", "Alexander", "Aaron"],
                 ["Bryant", "Black", "Block", "Barry", "Barton"],
                 ["Carter", "Cash", "Calvin", "Charles", "Christian"],
                 ["David", "Dominic", "Dwight", "Devin", "Derrick"],
                 ["Edison", "Edward", "Elton", "Elvis", "Eric"],
                 ["Favid", "Fominic", "Fwight", "Fevin", "Ferrick"],
                 ["Gavid", "Gominic", "Gwight", "Gevin", "Gerrick"],
                 ["Havid", "Hominic", "Hwight", "Hevin", "Herrick"]
    ]
    
    fileprivate lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: IndexController.cellID)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
    }
}

extension IndexController {
    func setupUI() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
    }
    
}

extension IndexController :UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return headers.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let itemArry = data[section]
        return itemArry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IndexController.cellID)!
        let arry = data[indexPath.section]
        let arryStr = arry[indexPath.row]
        cell.textLabel?.text = arryStr
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers[section];
    }
    
    //索引条
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return headers
    }
    
    //索引条点击监听,return几就是返回到哪个section
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        var currentIndex = 0
        //MARK: 遍历索引值
        for character in headers {
            //MARK: 判断索引值和组名称是否相等，返回组坐标
            if character == title {
                return currentIndex
            }
            currentIndex += 1
        }
        return 0
    }
    
}

