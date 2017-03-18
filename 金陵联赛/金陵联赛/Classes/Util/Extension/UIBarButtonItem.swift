//
//  UIBarButtonItem.swift
//  金陵联赛
//
//  Created by neo on 2017/3/7.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    
    /// 自定义UIBarButtonItem构造函数
    ///
    /// - Parameters:
    ///   - title: item标题
    ///   - fontSize: 字体大小
    ///   - target: 父类对象
    ///   - action: 监听函数
    convenience init(title: String, fontSize: CGFloat , target: AnyObject?, action: Selector){
        let btn = UIButton(type: .custom)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(UIColor.darkGray, for: .normal)
        btn.setTitleColor(UIColor.orange, for: .highlighted)
        btn.sizeToFit()
        btn.addTarget(target, action: action, for: .touchUpInside)
        
        self.init(customView: btn)
    }
}
