//
//  ViewController.swift
//  LocalVideoPlay
//
//  Created by suckerl on 2017/5/16.
//  Copyright © 2017年 suckerl. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {
   
    var dataSource = [
        NBAItem(image:"videoScreenshot01", name:"Tim Duncan" ,source:"Weibo - 0:30"),
        NBAItem(image:"videoScreenshot02", name:"Tracy McGrady" ,source:"YouTube - 8:30"),
        NBAItem(image:"videoScreenshot03", name:"Kobe Bryant" ,source:"Instgram"),
        NBAItem(image:"videoScreenshot04", name:"James Harden" ,source:"Viemo"),
        NBAItem(image:"videoScreenshot05", name:"Kevin Durant" ,source:"Facebook"),
        NBAItem(image:"videoScreenshot06", name:"LeBron James" ,source:"Twitter"),
    ]

    static let cellID = "CELL"
    
    var player = AVPlayer()
    var playerVC = AVPlayerViewController()
    
    
    
    fileprivate lazy var tableView :UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib.init(nibName: "NBACell", bundle: nil), forCellReuseIdentifier: cellID)
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.bounces = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
}

extension ViewController {
    func setupUI() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        
    }

}

extension ViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ViewController.cellID, for: indexPath) as! NBACell
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.lightGray
        
        let item = dataSource[indexPath.row]
        cell.bgImage.image = UIImage(named: item.image)
        cell.nameLabel.text = item.name
        cell.sourceLabel.text = item.source
        
        cell.delegate = self
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
} 

extension ViewController : cellDelegate {
    func playButtonClickWithDelegate() {
        print("play button click")
        
        guard let pathStr = Bundle.main.path(forResource: "1.mp4", ofType: nil) else {
             return
        }
        
        let url = URL(fileURLWithPath: pathStr)
        player = AVPlayer(url: url)
        playerVC.player = player
        self.show(playerVC, sender: nil)
    }

    
}
