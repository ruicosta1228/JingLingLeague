//
//  UITextField.swift
//  金陵联赛
//
//  Created by neo on 2017/4/6.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

extension UITextField{
    convenience init(frame: CGRect, textAlignment: NSTextAlignment, isPasswd: Bool = false) {
        self.init(frame: frame)
        
//        self.frame(forAlignmentRect: frame)
        
        self.textAlignment = textAlignment
        
        self.isSecureTextEntry = isPasswd
        
        self.sizeToFit()
    }
}
