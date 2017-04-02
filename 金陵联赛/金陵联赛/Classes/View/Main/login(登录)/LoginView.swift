//
//  LoginView.swift
//  金陵联赛
//
//  Created by neo on 2017/4/2.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

class LoginView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var wbBtn: UIButton = UIButton(title: "", normalColor: UIColor.black, highlightedColor: UIColor.orange, bgImageName: "login_weibo")
    
    lazy var qqBtn: UIButton = UIButton(title: "", normalColor: UIColor.black, highlightedColor: UIColor.orange, bgImageName: "login_tencent")
    
}

extension LoginView {
    func setupUI(){
        
        wbBtn.translatesAutoresizingMaskIntoConstraints = false
        qqBtn.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(wbBtn)
        addSubview(qqBtn)
        
        addConstraint(NSLayoutConstraint(item: wbBtn,
                                         attribute: .centerX,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .centerX,
                                         multiplier: 1.0,
                                         constant: -20))
        
        addConstraint(NSLayoutConstraint(item: wbBtn,
                                         attribute: .centerY,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .centerY,
                                         multiplier: 1.0,
                                         constant: -60))
        
        addConstraint(NSLayoutConstraint(item: qqBtn,
                                         attribute: .centerX,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .centerX,
                                         multiplier: 1.0,
                                         constant: 20))
        
        addConstraint(NSLayoutConstraint(item: qqBtn,
                                         attribute: .centerY,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .centerY,
                                         multiplier: 1.0,
                                         constant: -60))
        //微博监听
        wbBtn.addTarget(self, action: #selector(wbLogin), for: .touchUpInside)
        
        qqBtn.addTarget(self, action: #selector(qqLogin), for: .touchUpInside)
    }
}

//监听事件
extension LoginView{
    @objc func wbLogin(){
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: JLLPlayerShouldLoginByWeiboNotification), object: nil)
    }
    
    @objc func qqLogin(){
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: JLLPlayerShouldLoginByTencentQQNotification), object: nil)
    }
}
