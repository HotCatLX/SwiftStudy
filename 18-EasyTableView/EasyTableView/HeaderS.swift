//
//  HeaderS.swift
//  EasyTableView
//
//  Created by suckerl on 2017/5/22.
//  Copyright © 2017年 suckel. All rights reserved.
//

import UIKit
import SnapKit


protocol HeaderSDelegate {
    func buttonClick(button : UIButton)
}

class HeaderS: UITableViewHeaderFooterView {
    
    public var delegate : HeaderSDelegate?
    

    public lazy var button :UIButton = {
        let button = UIButton()
        button.setImage(UIImage.init(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(HeaderS.buttonClick(button:)), for: .touchUpInside)
        return button
    }()
    
    public lazy var label :UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkGray
        label.text = "Tset"
        label.backgroundColor = UIColor.green
        label.alpha = 0.4
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.addSubview(button)
        self.addSubview(label)
        self.constructLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeaderS {
    func constructLayout() {
        button.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(5)
            make.top.equalTo(self.contentView).offset(5)
            make.bottom.equalTo(self.contentView).offset(-5)
            make.width.equalTo(30)
        }

        label.snp.makeConstraints { (make) in
            make.left.equalTo(button.snp.right).offset(5)
            make.top.equalTo(button.snp.top)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        
//        button.frame = CGRect(x: 5, y: 5, width: 30, height: 30)
//        let space : CGFloat = 10
//        let X = button.frame.width  + space
//        let Y = button.frame.origin.y + space * 0.5
//        let str : String = label.text!
//        let originalString : NSString = str as NSString
//        let size : CGSize = originalString.size(attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15)])
//        label.frame = CGRect(x: X, y: Y, width: size.width, height: size.height)
    }
    
    func buttonClick(button : UIButton) {
        delegate?.buttonClick(button: button)
    }
}
