//
//  JLLComposeView.swift
//  金陵联赛
//
//  Created by Salasoul on 2017/3/30.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

class JLLComposeView: UIView {

    @IBOutlet weak var scrollView: UIScrollView!
    
    //按钮数据数组
    private let buttonInfo = [["imageName": "","title": "文字"],
                              ["imageName": "","title": "照片/视频"],
                              ["imageName": "","title": "拍摄"]
    ]
    
    class func composeView() -> JLLComposeView {
        
        let nib = UINib(nibName: "JLLComposeView", bundle: nil)
        
        let v = nib.instantiate(withOwner: nil, options: nil)[0] as! JLLComposeView
        
        v.frame = UIScreen.main.bounds
        
        return v
    }
    
    //显示当前视图
    func show() {
        guard let vc = UIApplication.shared.keyWindow?.rootViewController else {
            return
        }
        
        //添加视图
        vc.view.addSubview(self)
    }

    override func awakeFromNib() {
        setupUI()
    }
    
    @objc func clickButton() {
        print("按钮点击")
    }
    
    //关闭按钮
    @IBAction func close() {
        removeFromSuperview()
    }
    
}

extension JLLComposeView {
    func setupUI() {
        
//        let btn = JLLComposeButton.composeButton(imageName: "TabIcon", title: "sbf")
//        
//        btn.center = center
//        
//        addSubview(btn)
//        
//        btn.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
    }
}
