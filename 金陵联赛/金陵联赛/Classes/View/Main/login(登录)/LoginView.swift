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
    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func loginBtn(_ sender: Any) {
    }
    
    @IBAction func registerBtn(_ sender: Any) {
    }
    
    @IBAction func qqLogin(_ sender: Any) {
    }
    
    @IBAction func weiboLogin(_ sender: Any) {
    }
    
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
////        setupUI()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    func login() -> LoginView {
        let nib = UINib(nibName: "login", bundle: nil)
        let v = nib.instantiate(withOwner: nil, options: nil)[0] as! LoginView
        return v
    }

//    lazy var username = UILabel.init(withText: "用户名:", fontSize: 14.0, color: UIColor.black)
//    
//    lazy var password = UILabel.init(withText: "密码:", fontSize: 14.0, color: UIColor.black)
//    
//    lazy var username_input: UITextField = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
//    
//    lazy var password_input: UITextField = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
//    
//    lazy var wbBtn: UIButton = UIButton(title: "", normalColor: UIColor.black, highlightedColor: UIColor.orange, bgImageName: "login_weibo")
//    
//    lazy var qqBtn: UIButton = UIButton(title: "", normalColor: UIColor.black, highlightedColor: UIColor.orange, bgImageName: "login_tencent")
//    
//    lazy var submitBtn: UIButton = UIButton.init(title: "   确认   ", normalColor: UIColor.black, highlightedColor: UIColor.orange)
    
}

//extension LoginView {
//    func setupUI(){
//        username_input.borderStyle = UITextBorderStyle.roundedRect
//        password_input.borderStyle = UITextBorderStyle.roundedRect
//        
//        password_input.isSecureTextEntry = true
//        
////        wbBtn.translatesAutoresizingMaskIntoConstraints = false
////        qqBtn.translatesAutoresizingMaskIntoConstraints = false
////        username_input.translatesAutoresizingMaskIntoConstraints = false
////        password_input.translatesAutoresizingMaskIntoConstraints = false
////        username.translatesAutoresizingMaskIntoConstraints = false
////        password.translatesAutoresizingMaskIntoConstraints = false
////        submitBtn.translatesAutoresizingMaskIntoConstraints = false
//        
//        username.frame = CGRect(x: 80, y: 200, width: 180, height: 30)
//        username_input.frame = CGRect(x: 180, y: 200, width: 100, height: 30)
//        
//        password.frame = CGRect(x: 80, y: 300, width: 180, height: 30)
//        password_input.frame = CGRect(x: 180, y: 300, width: 100, height: 30)
//        
//        submitBtn.frame = CGRect(x: 100, y: 400, width: 160, height: 60)
//        
//        wbBtn.frame = CGRect(x: 150, y: 500, width: 30, height: 30)
//        qqBtn.frame = CGRect(x: 200, y: 500, width: 30, height: 30)
//        
//        addSubview(username_input)
//        addSubview(password_input)
//        addSubview(username)
//        addSubview(password)
//        addSubview(wbBtn)
//        addSubview(qqBtn)
//        addSubview(submitBtn)
//        
//
//        //微博监听
//        wbBtn.addTarget(self, action: #selector(wbLogin), for: .touchUpInside)
//        
//        qqBtn.addTarget(self, action: #selector(qqLogin), for: .touchUpInside)
//        
//        submitBtn.addTarget(self, action: #selector(nmLogin), for: .touchUpInside)
//    }
//}
//
////监听事件
//extension LoginView{
//    @objc func nmLogin(){
//        JLLNetworkingManager.shared.userAccount.pid = "10"
//        
//        NotificationCenter.default.post(name: NSNotification.Name(rawValue: JLLPlayerLoginSuccessNotification), object: nil)
//        
//        NotificationCenter.default.post(name: NSNotification.Name(rawValue: VistorView2TableView), object: nil)
//
//        
////        JLLNetworkingManager.shared.login_normal(input: username_input.text, password: password_input.text, completion: { (isSuccess) in 
////            if isSuccess {
////                SVProgressHUD.showInfo(withStatus: "登录成功")
////                
////                SVProgressHUD.dismiss(withDelay: 2)
////                
////                NotificationCenter.default.post(name: NSNotification.Name(rawValue: JLLPlayerLoginSuccessNotification), object: nil)
////        
////                NotificationCenter.default.post(name: NSNotification.Name(rawValue: VistorView2TableView), object: nil)
////        
////            } else {
////                SVProgressHUD.showInfo(withStatus: "登录失败")
////                
////                print("登录失败")
////                
////                SVProgressHUD.dismiss(withDelay: 2)
////
////            }
////        })
//        
//
//    }
//    
//    @objc func wbLogin(){
//        
//        NotificationCenter.default.post(name: NSNotification.Name(rawValue: JLLPlayerShouldLoginByWeiboNotification), object: nil)
//    }
//    
//    @objc func qqLogin(){
//        
//        NotificationCenter.default.post(name: NSNotification.Name(rawValue: JLLPlayerShouldLoginByTencentQQNotification), object: nil)
//    }
//}

