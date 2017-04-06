//
//  JLLStatusPictureView.swift
//  金陵联赛
//
//  Created by Salasoul on 2017/4/6.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

class JLLStatusPictureView: UIView {

    @IBOutlet weak var heightCons: NSLayoutConstraint!
    
    override func awakeFromNib() {
        setupUI()
    }

}


extension JLLStatusPictureView {
    func setupUI() {
        
        //超出边界的内容不显示
        clipsToBounds = true
        
        let count = 3
        
        //FIXME-修改每个imageView的位置
        let rect = CGRect(x: 0,
                          y: 100,
                          width: 100,
                          height: 100)
        
        //循环创建9个imageView
        for i in 0..<count * count {
            
            let iv = UIImageView()
            
            iv.backgroundColor = UIColor.blue
            
            //行
            let row = CGFloat(i / count)
            //列
            let col = CGFloat(i % count)
            
            //FIXME
            let xOffset = col //* (JLLStatusPictureItemWidth + JLLStatusPictureInnerMargin)
            let yOffset = row //* (JLLStatusPictureItemWidth + JLLStatusPictureInnerMargin)
            
            iv.frame = rect.offsetBy(dx: xOffset, dy: yOffset)
            
            addSubview(iv)
        }
        
    }
}
