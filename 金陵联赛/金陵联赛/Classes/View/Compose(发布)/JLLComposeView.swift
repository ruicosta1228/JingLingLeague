//
//  JLLComposeView.swift
//  金陵联赛
//
//  Created by Salasoul on 2017/3/30.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit
import pop

class JLLComposeView: UIView {

    @IBOutlet weak var scrollView: UIScrollView!
    
    //时间
    @IBOutlet weak var timeLabel: UILabel!
    
    //日期
    @IBOutlet weak var dateLabel: UILabel!
    
    //按钮数据数组
    let buttonInfo = [["imageName": "btn_1","title": "文字"],
                              ["imageName": "btn_2","title": "照片/视频"],
                              ["imageName": "btn_3","title": "拍摄"]
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
        
        //时间
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyy-MM-dd 'at' HH:mm"
        let strNowTime = formatter.string(from: date as Date) as String
        let timeArray = strNowTime.components(separatedBy: "at")
        timeLabel.text = timeArray[1]
        dateLabel.text = timeArray[0]
        
        //添加视图
        vc.view.addSubview(self)
        
        //开始动画
        showCurrentView()
        
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

//动画方法扩展
extension JLLComposeView {
    
    //动画显示当前视图
    func showCurrentView() {
        
        //创建动画
        let anim: POPBasicAnimation = POPBasicAnimation(propertyNamed: kPOPViewAlpha)
        
        anim.fromValue = 0
        anim.toValue = 1
        anim.duration = 0.5
        
        //添加到视图
        pop_add(anim, forKey: nil)
    }
}

extension JLLComposeView {
    func setupUI() {

        //强行更新布局
        layoutIfNeeded()
        
        //向scrollView添加视图
        let rect = scrollView.bounds
        
        let v = UIView(frame: rect)
        
        //向视图添加按钮
        addButtons(v: v, idx: 0)
        
        //将视图添加到scrollView
        scrollView.addSubview(v)
    }
    
    //向v中添加按钮,按钮的数组索引从idx开始
    func addButtons(v: UIView,idx: Int) {
        
        let count = 3
        
        for i in idx..<(idx + count){
            
            if idx >= buttonInfo.count {
                break
            }
            
            //从数组字典中获取图像名称和title
            let dict = buttonInfo[i]
            guard let imageName = dict["imageName"],
                let title = dict["title"] else {
                    continue
            }
            
            //创建按钮
            let btn = JLLComposeButton.composeButton(imageName: imageName, title: title)
            
            //将btn添加到视图
            v.addSubview(btn)
            
            //添加监听方法
            
        }
        
        //布局按钮
        let btnSize = CGSize(width: 100, height: 100)
        let margin = (v.bounds.width - 3 * btnSize.width) / 4
        
        for (i, btn) in v.subviews.enumerated() {
            
            let y = 6
            let x = CGFloat(i + 1) * margin + CGFloat(i) * btnSize.width
            
            btn.frame = CGRect(x: x, y: CGFloat(y), width: btnSize.width, height: btnSize.height)
            
        }
    }
}
