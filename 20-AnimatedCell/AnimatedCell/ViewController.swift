//
//  ViewController.swift
//  AnimatedCell
//
//  Created by suckerl on 2017/5/24.
//  Copyright © 2017年 suckel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    static let cellId = "cell"
    
    fileprivate lazy var tableView :UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AnimatedCell.classForCoder(), forCellReuseIdentifier: ViewController.cellId)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.lightGray
        return tableView
    }()
    
    let mockItem : [cellItem] = [
        cellItem(name:"Ferrari"),
        cellItem(name:"Lamborghini"),
        cellItem(name:"Aston Martin"),
        cellItem(name:"Porsche"),
        cellItem(name:"Audi"),
        cellItem(name:"Benz"),
        cellItem(name:"BMW"),
        cellItem(name:"Honda"),
        cellItem(name:"Toyota"),
        cellItem(name:"Land Rover"),
        cellItem(name:"Bugatti"),
        cellItem(name:"Volkswagen"),
        cellItem(name:"Alfa_Romeo")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
}

extension ViewController : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ViewController.cellId, for: indexPath)
        cell.selectionStyle = .none
        cell.backgroundColor = colorforIndex(indexPath.row)
        let item = mockItem[indexPath.row]
        cell.textLabel?.text = item.name
        cell.textLabel?.font = UIFont(name: "Avenir Next", size: 16)
        return cell
    }

    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.layer.transform = CATransform3DMakeScale(0.7, 0.7, 1.0)
        UIView.animate(withDuration: 0.5) {
            cell.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0)
        }
    }
    
    
    func colorforIndex(_ index: Int) -> UIColor {
        let itemCount = mockItem.count - 1
        let color = (CGFloat(index) / CGFloat(itemCount)) * 0.7
        return UIColor(red: color, green: 0.5, blue: 1.0, alpha: 1.0)
    }

}

