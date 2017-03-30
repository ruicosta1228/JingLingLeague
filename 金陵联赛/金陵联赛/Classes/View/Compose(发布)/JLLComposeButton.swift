//
//  JLLComposeButton.swift
//  金陵联赛
//
//  Created by Salasoul on 2017/3/30.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

class JLLComposeButton: UIControl {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!

    //使用图像名称&标题创建按钮，按钮布局从xib获取
    class func composeButton(imageName: String, title: String) -> JLLComposeButton {
        
        let nib = UINib(nibName: "JLLComposeButton", bundle: nil)
        
        let btn = nib.instantiate(withOwner: nil, options: nil)[0] as! JLLComposeButton
        
        btn.imageView.image = UIImage(named: imageName)
        btn.titleLabel.text = title
        
        return btn
    }
    
}
