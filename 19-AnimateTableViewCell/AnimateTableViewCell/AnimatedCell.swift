//
//  AnimatedCell.swift
//  AnimateTableViewCell
//
//  Created by suckerl on 2017/5/24.
//  Copyright © 2017年 suckel. All rights reserved.
//

import UIKit

struct cellItem {
    var name : String
}


class AnimatedCell: UITableViewCell {

    //MARK:- 渐变色
    let gradientLayer = CAGradientLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        gradientLayer.frame = self.contentView.bounds
        let color1 = UIColor(white: 1, alpha: 0.5)
        let color2 = UIColor(white: 1, alpha: 0.3)
        let color3 = UIColor(white: 1, alpha: 0.1)
        let color4 = UIColor(white: 1, alpha: 0.05)
        
        gradientLayer.colors = [color1,color2,color3,color4]
        gradientLayer.locations = [0.0, 0.1, 0.95, 1.0]
        self.contentView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
  
}
