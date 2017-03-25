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
    
    //使用字典设置访客视图信息
    //首页 imageName == ""
    func setupInfo(dict: [String: String]) {
        //取字典信息
        guard let imageName = dict["imageName"],
            let message = dict["message"] else {
                return
        }
        
        //设置消息
        tipLabel.text = message
        
        //设置图像
        if imageName == "" {
            return
        }
        iconView.image = UIImage(named: imageName)
    }
    
    
    lazy var iconView: UIImageView = UIImageView(image: UIImage(named: "visitor_first_image"))
    
    //private lazy var iconView = UIImageView(image: UIImage(named: "TabIcon"))
    
    //遮罩图像
//    lazy var maskIconView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
    
    lazy var tipLabel: UILabel = UILabel(withText: "关注一些人，回这里看看有什么惊喜",
                                         fontSize: 14,
                                         color: UIColor.black)
    
    //注册
    lazy var registerButton: UIButton = UIButton(
        title: "注册",
        fontSize: 16,
        normalColor: UIColor.orange,
        highlightedColor: UIColor.black,
        bgImageName: "common_button_white_disable")
    
    //登录
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
        
//        addSubview(maskIconView)
        
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

//        //遮罩图像
//        let viewDict = ["maskIconView": maskIconView, "registerButton": registerButton] as [String : Any]
//        addConstraints(NSLayoutConstraint.constraints(
//            withVisualFormat: "H:|-0-[maskIconView]-0-|",
//            options: [],
//            metrics: nil,
//            views: viewDict))
//        addConstraints(NSLayoutConstraint.constraints(
//            withVisualFormat: "V:|-0-[maskIconView]-(-35)-[registerButton]",
//            options: [],
//            metrics: nil,
//            views: viewDict))
        
    }
}
