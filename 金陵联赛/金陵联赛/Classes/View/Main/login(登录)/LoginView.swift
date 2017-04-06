//
//  LoginView.swift
//  金陵联赛
//
//  Created by neo on 2017/4/2.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit
import SVProgressHUD

class LoginView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var username = UILabel.init(withText: "用户名:", fontSize: 14.0, color: UIColor.black)
    
    lazy var password = UILabel.init(withText: "密码:", fontSize: 14.0, color: UIColor.black)
    
    lazy var username_input: UITextField = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
    
    lazy var password_input: UITextField = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
    
    lazy var wbBtn: UIButton = UIButton(title: "", normalColor: UIColor.black, highlightedColor: UIColor.orange, bgImageName: "login_weibo")
    
    lazy var qqBtn: UIButton = UIButton(title: "", normalColor: UIColor.black, highlightedColor: UIColor.orange, bgImageName: "login_tencent")
    
    lazy var submitBtn: UIButton = UIButton.init(title: "   确认   ", normalColor: UIColor.black, highlightedColor: UIColor.orange)
    
}

extension LoginView {
    func setupUI(){
        username_input.borderStyle = UITextBorderStyle.roundedRect
        password_input.borderStyle = UITextBorderStyle.roundedRect
        
        password_input.isSecureTextEntry = true
        
//        wbBtn.translatesAutoresizingMaskIntoConstraints = false
//        qqBtn.translatesAutoresizingMaskIntoConstraints = false
//        username_input.translatesAutoresizingMaskIntoConstraints = false
//        password_input.translatesAutoresizingMaskIntoConstraints = false
//        username.translatesAutoresizingMaskIntoConstraints = false
//        password.translatesAutoresizingMaskIntoConstraints = false
//        submitBtn.translatesAutoresizingMaskIntoConstraints = false
        
        username.frame = CGRect(x: 80, y: 200, width: 180, height: 30)
        username_input.frame = CGRect(x: 180, y: 200, width: 100, height: 30)
        
        password.frame = CGRect(x: 80, y: 300, width: 180, height: 30)
        password_input.frame = CGRect(x: 180, y: 300, width: 100, height: 30)
        
        submitBtn.frame = CGRect(x: 100, y: 400, width: 160, height: 60)
        
        wbBtn.frame = CGRect(x: 150, y: 500, width: 30, height: 30)
        qqBtn.frame = CGRect(x: 200, y: 500, width: 30, height: 30)
        
        addSubview(username_input)
        addSubview(password_input)
        addSubview(username)
        addSubview(password)
        addSubview(wbBtn)
        addSubview(qqBtn)
        addSubview(submitBtn)
        
//        //label
//        addConstraint(NSLayoutConstraint(item: username,
//                                         attribute: .centerX,
//                                         relatedBy: .equal,
//                                         toItem: username_input,
//                                         attribute: .centerX,
//                                         multiplier: 1.0,
//                                         constant: -50))
//        
//        addConstraint(NSLayoutConstraint(item: username,
//                                         attribute: .centerY,
//                                         relatedBy: .equal,
//                                         toItem: self,
//                                         attribute: .centerY,
//                                         multiplier: 1.0,
//                                         constant: 20))
//        
//        addConstraint(NSLayoutConstraint(item: password,
//                                         attribute: .centerX,
//                                         relatedBy: .equal,
//                                         toItem: self,
//                                         attribute: .centerX,
//                                         multiplier: 1.0,
//                                         constant: -50))
//        
//        addConstraint(NSLayoutConstraint(item: password,
//                                         attribute: .centerY,
//                                         relatedBy: .equal,
//                                         toItem: self,
//                                         attribute: .centerY,
//                                         multiplier: 1.0,
//                                         constant: -20))
//        
//        //textField
//        addConstraint(NSLayoutConstraint(item: username_input,
//                                         attribute: .centerX,
//                                         relatedBy: .equal,
//                                         toItem: self,
//                                         attribute: .centerX,
//                                         multiplier: 1.0,
//                                         constant: 0))
//        
//        addConstraint(NSLayoutConstraint(item: username_input,
//                                         attribute: .centerY,
//                                         relatedBy: .equal,
//                                         toItem: self,
//                                         attribute: .centerY,
//                                         multiplier: 1.0,
//                                         constant: -20))
//        
//        addConstraint(NSLayoutConstraint(item: password_input,
//                                         attribute: .centerX,
//                                         relatedBy: .equal,
//                                         toItem: self,
//                                         attribute: .centerX,
//                                         multiplier: 1.0,
//                                         constant: 0))
//        
//        addConstraint(NSLayoutConstraint(item: password_input,
//                                         attribute: .centerY,
//                                         relatedBy: .equal,
//                                         toItem: self,
//                                         attribute: .centerY,
//                                         multiplier: 1.0,
//                                         constant: 20))
//
//        
//        //button
//        addConstraint(NSLayoutConstraint(item: submitBtn,
//                                         attribute: .centerX,
//                                         relatedBy: .equal,
//                                         toItem: self,
//                                         attribute: .centerX,
//                                         multiplier: 1.0,
//                                         constant: 0))
//        
//        addConstraint(NSLayoutConstraint(item: submitBtn,
//                                         attribute: .centerY,
//                                         relatedBy: .equal,
//                                         toItem: self,
//                                         attribute: .centerY,
//                                         multiplier: 1.0,
//                                         constant: 60))
//        
//        addConstraint(NSLayoutConstraint(item: wbBtn,
//                                         attribute: .centerX,
//                                         relatedBy: .equal,
//                                         toItem: self,
//                                         attribute: .centerX,
//                                         multiplier: 1.0,
//                                         constant: -20))
//        
//        addConstraint(NSLayoutConstraint(item: wbBtn,
//                                         attribute: .centerY,
//                                         relatedBy: .equal,
//                                         toItem: self,
//                                         attribute: .centerY,
//                                         multiplier: 1.0,
//                                         constant: 130))
//        
//        addConstraint(NSLayoutConstraint(item: qqBtn,
//                                         attribute: .centerX,
//                                         relatedBy: .equal,
//                                         toItem: self,
//                                         attribute: .centerX,
//                                         multiplier: 1.0,
//                                         constant: 20))
//        
//        addConstraint(NSLayoutConstraint(item: qqBtn,
//                                         attribute: .centerY,
//                                         relatedBy: .equal,
//                                         toItem: self,
//                                         attribute: .centerY,
//                                         multiplier: 1.0,
//                                         constant: 130))
        //微博监听
        wbBtn.addTarget(self, action: #selector(wbLogin), for: .touchUpInside)
        
        qqBtn.addTarget(self, action: #selector(qqLogin), for: .touchUpInside)
        
        submitBtn.addTarget(self, action: #selector(nmLogin), for: .touchUpInside)
    }
}

//监听事件
extension LoginView{
    @objc func nmLogin(){
        SVProgressHUD.showInfo(withStatus: "登录成功")
        
        JLLNetworkingManager.shared.userAccount.pId = "10"
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: JLLPlayerLoginSuccessNotification), object: nil)
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: VistorView2TableView), object: nil)
        
        SVProgressHUD.dismiss()

    }
    
    @objc func wbLogin(){
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: JLLPlayerShouldLoginByWeiboNotification), object: nil)
    }
    
    @objc func qqLogin(){
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: JLLPlayerShouldLoginByTencentQQNotification), object: nil)
    }
}
