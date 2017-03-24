//
//  UIButton.swift
//  金陵联赛
//
//  Created by neo on 2017/3/24.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

extension UIButton{
    convenience init(title: String, fontSize: CGFloat = 14, normalColor: UIColor, highlightedColor: UIColor, bgImageName: String = ""){
        self.init()
        
        self.setTitle(title, for: .normal)
        
        self.setTitleColor(normalColor, for: .normal)
        
        self.setTitleColor(highlightedColor, for: .highlighted)
        
        self.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        
        if bgImageName != ""{
            self.setBackgroundImage(UIImage(named: bgImageName), for: .normal)
        }
        
        self.sizeToFit()
    }
}
