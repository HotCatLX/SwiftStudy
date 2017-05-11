//
//  LoginController.swift
//  LoginAnimation
//
//  Created by suckerl on 2017/5/11.
//  Copyright © 2017年 suckerl. All rights reserved.
//

import UIKit
import SnapKit

class LoginController: UIViewController {

    fileprivate lazy var userName : UITextField = {
        let userName = UITextField()
        userName.placeholder = "username"
        userName.layer.cornerRadius = 5
        userName.backgroundColor = UIColor.yellow
        userName.alpha = 0.5
        return userName
    }()
    
    fileprivate lazy var password : UITextField = {
        let password = UITextField()
        password.placeholder = "password"
        password.layer.cornerRadius = 5
        password.backgroundColor = UIColor.yellow
        password.alpha = 0.5
        return password
    }()
    
    fileprivate lazy var loginButton :UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = UIColor.darkGray
        loginButton.alpha = 0.3
        loginButton.layer.cornerRadius = 5
        loginButton.addTarget(self, action: #selector(LoginController.buttonClick), for: .touchUpInside)
        return loginButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNav()
        view.addSubview(userName)
        view.addSubview(password)
        view.addSubview(loginButton)
        self.constructLayout()
    }

}

////MARK:- setupNav
extension LoginController {
    func setupNav() {
        self.navigationItem.title = "Login"
        let leftItem = UIBarButtonItem(image: UIImage.init(named: "back"), style: .plain, target: self, action: #selector(LoginController.back))
        self.navigationItem.leftBarButtonItem = leftItem
    }

    func back() {
        self .dismiss(animated: true, completion: nil)
    }
}

extension LoginController {
    
    func constructLayout() {
        
        userName.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(100)
            make.left.equalTo(self.view).offset(50)
            make.right.equalTo(self.view).offset(-50)
            make.height.equalTo(20)
        }
        
       password.snp.makeConstraints { (make) in
            make.top.equalTo(userName.snp.bottom).offset(20)
            make.left.right.height.equalTo(userName)
        }
        
        loginButton.snp.makeConstraints { (make) in
            make.top.equalTo(password.snp.bottom).offset(50)
            make.left.equalTo(self.view).offset(100)
            make.right.equalTo(self.view).offset(-100)
            make.height.equalTo(30)
        }
        
    }
}

//MARK:- buttonClick
extension LoginController {
    func buttonClick()  {
    var bounds = self.loginButton.bounds

        if bounds.size.width > 300 {
            bounds = CGRect(x: 0, y: 0, width: 175, height: 30)
            self.loginButton.alpha = 0.5
        }
//        dampingRatio（阻尼系数） 
//        velocity （弹性速率)
        
      UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveLinear, animations: {
   
        self.loginButton.alpha += 0.2
        self.loginButton.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 80, height: bounds.size.height)
        
        
      }, completion: nil)
    }
}
