//
//  Cell.swift
//  SwipeCell
//
//  Created by suckerl on 2017/5/18.
//  Copyright © 2017年 suckerl. All rights reserved.
//

import UIKit
import SnapKit

struct cellItem {
    let image : String
    let name : String
}



class Cell: UITableViewCell {

    var imageIcon = UIImageView()
    var nameLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.setupUI()
    }

}

extension Cell {
    func setupUI() {
        imageIcon.layer.cornerRadius = 8
        
        nameLabel.textAlignment = .left
        nameLabel.font = UIFont.systemFont(ofSize: 15)
        nameLabel.textColor = UIColor.orange
        
        self.contentView.addSubview(imageIcon)
        self.contentView.addSubview(nameLabel)
        self.constructLayout()
    }
    
    func constructLayout() {
        imageIcon.snp.makeConstraints { (make) in
            make.left.top.equalTo(self.contentView).offset(5)
            make.bottom.equalTo(self.contentView).offset(-5)
            make.width.equalTo(100)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(imageIcon.snp.right).offset(10)
            make.centerY.equalTo(self.contentView)
            make.height.equalTo(30)
            make.width.equalTo(150)
        }
    }

}
