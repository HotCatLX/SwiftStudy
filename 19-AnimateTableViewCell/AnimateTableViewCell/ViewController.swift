//
//  ViewController.swift
//  AnimateTableViewCell
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
//        tableView.separatorColor = UIColor.orange
        tableView.separatorStyle = .none
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
        UIApplication.shared.isStatusBarHidden = true
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.animated()
    }
}

extension ViewController : UITableViewDataSource , UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ViewController.cellId, for: indexPath)
        cell.backgroundColor =  colorforIndex(indexPath.row)
        cell.selectionStyle = .none
        let item = mockItem[indexPath.row]
        cell.textLabel?.text = item.name
        cell.textLabel?.font = UIFont(name: "Avenir Next", size: 16)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        animated()
    }
    
}

extension ViewController {
    func animated() {
        tableView.reloadData()
        
        let cells = tableView.visibleCells
        let tableHeight: CGFloat = tableView.bounds.size.height

        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        
        var index = 0
        for cell in cells {
            UIView.animate(withDuration: 1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: nil)
            
            index += 1
        }
    }
    
    func colorforIndex(_ index: Int) -> UIColor {
        let itemCount = mockItem.count - 1
        let color = (CGFloat(index) / CGFloat(itemCount)) * 0.7
        return UIColor(red: 0.3, green: color, blue: 0.8, alpha: 1.0)
    }

}

