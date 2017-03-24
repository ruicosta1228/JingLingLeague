//
//  UILabel.swift
//  金陵联赛
//
//  Created by neo on 2017/3/24.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

extension UILabel{
    /// 自定义UILabel构造函数
    ///
    /// - Parameters:
    ///   - withText: text内容
    ///   - fontSize: 字体大小
    ///   - color: text字体颜色
    convenience init(withText: String, fontSize: CGFloat = 14, color: UIColor){
        
        self.init()
        
        self.text = withText
        
        self.font = UIFont.systemFont(ofSize: fontSize)
        
        self.textColor = color
        
        self.sizeToFit()
        
    }
    
}
