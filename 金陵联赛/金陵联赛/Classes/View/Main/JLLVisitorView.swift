//
//  JLLVisitorView.swift
//  金陵联赛
//
//  Created by neo on 2017/3/24.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

class JLLVisitorView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var iconView: UIImageView = UIImageView(image: UIImage(named: "visitor_first_image"))
    
    //private lazy var iconView = UIImageView(image: UIImage(named: "TabIcon"))
    
    lazy var tipLabel: UILabel = UILabel(withText: "关注一些人，回这里看看有什么惊喜", fontSize: 14, color: UIColor.black)

    lazy var registerButton: UIButton = UIButton(
        title: "注册",
        fontSize: 16,
        normalColor: UIColor.gray,
        highlightedColor: UIColor.black,
        bgImageName: "common_button_white_disable")
    
    lazy var loginButton: UIButton = UIButton(
        title: "登录",
        fontSize: 16,
        normalColor: UIColor.gray,
        highlightedColor: UIColor.black,
        bgImageName: "common_button_white_disable")
}

extension JLLVisitorView{
     func setupUI(){
        backgroundColor = UIColor.white
        
        addSubview(iconView)
        
        addSubview(tipLabel)
        
        addSubview(registerButton)
        
        addSubview(loginButton)
        
        //取消autoresizing
        for v in subviews{
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        
        //自动布局
        //图像视图
        addConstraint(NSLayoutConstraint(item: iconView,
                                         attribute: .centerX,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .centerX,
                                         multiplier: 1.0,
                                         constant: 0))
        
        addConstraint(NSLayoutConstraint(item: iconView,
                                         attribute: .centerY,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .centerY,
                                         multiplier: 1.0,
                                         constant: -60))
        
        //label布局
        addConstraint(NSLayoutConstraint(item: tipLabel,
                                         attribute: .centerX,
                                         relatedBy: .equal,
                                         toItem: iconView,
                                         attribute: .centerX,
                                         multiplier: 1.0,
                                         constant: 0))
        
        addConstraint(NSLayoutConstraint(item: tipLabel,
                                         attribute: .centerY,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .centerY,
                                         multiplier: 1.0,
                                         constant: 0))
        //按钮布局
        //注册
        addConstraint(NSLayoutConstraint(item: registerButton,
                                         attribute: .left,
                                         relatedBy: .equal,
                                         toItem: tipLabel,
                                         attribute: .left,
                                         multiplier: 1.0,
                                         constant: 0))
        
        addConstraint(NSLayoutConstraint(item: registerButton,
                                         attribute: .top,
                                         relatedBy: .equal,
                                         toItem: tipLabel,
                                         attribute: .bottom,
                                         multiplier: 1.0,
                                         constant: +40))
        
        addConstraint(NSLayoutConstraint(item: registerButton,
                                         attribute: .width,
                                         relatedBy: .equal,
                                         toItem: nil,
                                         attribute: .notAnAttribute,
                                         multiplier: 1.0,
                                         constant: 100))
        //登录
        addConstraint(NSLayoutConstraint(item: loginButton,
                                         attribute: .right,
                                         relatedBy: .equal,
                                         toItem: tipLabel,
                                         attribute: .right,
                                         multiplier: 1.0,
                                         constant: 0))
        
        addConstraint(NSLayoutConstraint(item: loginButton,
                                         attribute: .top,
                                         relatedBy: .equal,
                                         toItem: tipLabel,
                                         attribute: .bottom,
                                         multiplier: 1.0,
                                         constant: +40))
        
        addConstraint(NSLayoutConstraint(item: loginButton,
                                         attribute: .width,
                                         relatedBy: .equal,
                                         toItem: registerButton,
                                         attribute: .width,
                                         multiplier: 1.0,
                                         constant: 0))


    }
}
