//
//  ViewController.swift
//  OpenDocumentsByWebView
//
//  Created by suckerl on 2017/5/19.
//  Copyright © 2017年 suckerl. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK:PDF，PPTX，DOCX等等格式都支持
        guard let urlStr = Bundle.main.path(forResource: "思维导图使用培训_20170517.pptx", ofType: "") else {
            return
        }
        
        let url = URL(fileURLWithPath: urlStr)
        
        let wkwebview = WKWebView(frame: view.bounds)
        wkwebview.load(URLRequest(url: url))
        
        view.addSubview(wkwebview)
    }
}

