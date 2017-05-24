//
//  ViewController.swift
//  EasyTableView
//
//  Created by suckerl on 2017/5/22.
//  Copyright © 2017年 suckel. All rights reserved.
//

import UIKit

struct Item {
    var name : String
    var items : [String]
    var isOpen : Bool
    
    //构造函数
    init(name : String , items : [String]) {
        self.name = name
        self.items = items
        //默认是打开
        self.isOpen = true
    }
}


class ViewController: UIViewController {

    static let cellID = "id"
    static let headerID = "head"
    
    var mockItems = [Item]()
    
    fileprivate lazy var tableView :UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: ViewController.cellID)
        tableView.register(HeaderS.self, forHeaderFooterViewReuseIdentifier: ViewController.headerID)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //mock数据
        mockItems = [
            Item(name: "Farrari", items: ["LaFerrari", "Enzo", "F40", "F50", "288GTO", "FXX K","FXX"]),
            Item(name: "Lamborghini", items: ["Aventador", "Reventon", "Huracan", "Gallardo", "Sesto Elemento", "Veneno", "Centenario", "Diablo"]),
            Item(name: "Aston Martin", items: ["One-77", "Vanquish", "Vulcan", "Vantage", "Rapide", "DBS", "DB11"]),
            Item(name: "Porsche", items: ["918 Spyder", "Cayenne", "Macan", "911 Turbo S", "Panamera", "Carrera GT"])
        ]
        self.setupUI()
    }
}

//MARK:- setupUI
extension ViewController {
    func setupUI() {
        tableView.frame = CGRect(x: 0, y: 20, width: view.bounds.width, height: view.bounds.height - 20)
        view.addSubview(tableView)
    }
}

//MARK:- UITableViewDelegate ,UITableViewDataSource
extension ViewController : UITableViewDelegate ,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ViewController.headerID) as! HeaderS
        let name = mockItems[section]
        header.label.text = name.name
        header.delegate = self
        header.button.tag = section
        header.contentView.backgroundColor = UIColor.lightGray
        header.alpha = 0.5
        
        header.button.rotate(name.isOpen ? 0.0 : CGFloat(Double.pi / 2))
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
 
    func numberOfSections(in tableView: UITableView) -> Int {
        return mockItems.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let item = mockItems[section]
        if item.isOpen == false {
            return 0
        }else {
            return item.items.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: ViewController.cellID, for: indexPath)
        let item = mockItems[indexPath.section]
        cell.textLabel?.text = item.items[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        return cell
    }
}

extension ViewController : HeaderSDelegate {
    func buttonClick(button: UIButton) {

        //这里需要注意要将修改的赋值给模型
        let isopen = mockItems[button.tag].isOpen
//        print("\(mockItems[button.tag].isOpen)")
        mockItems[button.tag].isOpen = !isopen
//        print("\(mockItems[button.tag].isOpen)")
        tableView.reloadSections(IndexSet(integer: button.tag), with: .automatic)
        
    }
}

//MARK:按钮rotate旋转
extension UIView {
    func rotate(_ toValue: CGFloat, duration: CFTimeInterval = 0.2, completionDelegate: AnyObject? = nil) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.toValue = toValue
        rotateAnimation.duration = duration
        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.fillMode = kCAFillModeForwards
        self.layer.add(rotateAnimation, forKey: nil)
    }
}

