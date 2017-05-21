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
        JLLNetworkingManager.shared.login_normal(input: userName.text, password: password.text, completion: { (isSuccess) in
                        
                        if isSuccess {
                            SVProgressHUD.showInfo(withStatus: "登录成功")
            
                            SVProgressHUD.dismiss(withDelay: 2)
            
                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: JLLPlayerLoginSuccessNotification), object: nil)
            
                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: VistorView2TableView), object: nil)
            
                        } else {
                            SVProgressHUD.showInfo(withStatus: "登录失败")
            
                            print("登录失败")
                            
                            SVProgressHUD.dismiss(withDelay: 2)
            
                        }
                    })
    }
    
    @IBAction func registerBtn(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: JLLPlayerShouldRegisterNotification), object: nil)
    }
    
    @IBAction func qqLogin(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: JLLPlayerShouldLoginByTencentQQNotification), object: nil)
    }
    
    @IBAction func weiboLogin(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: JLLPlayerShouldLoginByWeiboNotification), object: nil)
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
}
