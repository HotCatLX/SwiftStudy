//
//  NBACell.swift
//  LocalVideoPlay
//
//  Created by suckerl on 2017/5/16.
//  Copyright © 2017年 suckerl. All rights reserved.
//

import UIKit

struct NBAItem {
    let image : String
    let name : String
    let source : String
}

protocol cellDelegate {
    func playButtonClickWithDelegate()
}

class NBACell: UITableViewCell {
    
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    
    //代理属性
    var delegate : cellDelegate?
    //闭包
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func playButtonClick(_ sender: Any) {
        delegate?.playButtonClickWithDelegate()
    }
}
