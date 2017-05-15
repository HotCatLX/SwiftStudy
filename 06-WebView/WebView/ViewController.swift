//
//  ViewController.swift
//  WebView
//
//  Created by suckerl on 2017/5/15.
//  Copyright © 2017年 suckerl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var web: UIWebView!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        textField.clearsOnBeginEditing = true
        web.delegate = self
        loading.isHidden = true
    }
}

extension ViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        guard let textStr = textField.text else {
            return false
        }
        let urlStr = "https://" + textStr
        let url = NSURL(string: urlStr)
        
        guard let urlA = url else {
            return false
        }
        
        let request = NSURLRequest(url: urlA as URL)
        web.loadRequest(request as URLRequest)
        
        loading.isHidden = false
        
        //解除textField的第一响应者的注册资格，隐藏键盘
        textField.resignFirstResponder()

        //需要添加Url的判断
        
        return true
    }
}


extension ViewController : UIWebViewDelegate {
    func webViewDidStartLoad(_ webView: UIWebView) {
        loading.startAnimating()
        
        //状态栏的网络请求菊花 开始转动 -- 顶部20状态栏
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        loading.isHidden = true
        loading.stopAnimating()
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}
