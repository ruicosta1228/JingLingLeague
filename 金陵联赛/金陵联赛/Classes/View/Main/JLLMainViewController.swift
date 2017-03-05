//
//  JLLMainViewController.swift
//  金陵联赛
//
//  Created by neo on 2017/3/5.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

class JLLMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupChildControllers()
        setupComposeButton()
    }
    
    var composeButton = UIButton(frame:CGRect(x:0, y:0, width:100, height:30))

    
}

extension JLLMainViewController{
    //设置中间按钮
    func setupComposeButton(){
        composeButton.setImage(UIImage(named: "TabIcon"), for: .normal)
        let count = CGFloat(childViewControllers.count)
        let w = tabBar.bounds.width / count - 1 //容错点
        
        composeButton.frame = tabBar.bounds.insetBy(dx: 2 * w, dy: 0)
        tabBar.addSubview(composeButton)

    }
    
    //设置子控制器
    func setupChildControllers(){
        let array = [
            ["clsName": "JLLSocietyViewController", "title": "社区", "imageName": ""],
            ["clsName": "JLLDiscoveryViewController", "title": "约球", "imageName": ""],
            ["clsName": ""],
            ["clsName": "JLLScheduleViewController", "title": "比赛", "imageName": ""],
            ["clsName": "JLLProfileViewController", "title": "个人", "imageName": ""],
        ]
        
        var arrayM = [UIViewController]()
        
        for dict in array{
            arrayM.append(controller(dict: dict))
        }
        
        viewControllers = arrayM
    }
    
    
    private func controller(dict: [String: String]) -> UIViewController{
        guard let clsName = dict["clsName"],
        let title = dict["title"],
        //let imageName = dict["imageName"],
        let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? UIViewController.Type else {
            
                return UIViewController()
            
        }
        
        let vc = cls.init()
        vc.title = title
        
        //设置选中高亮
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.blue], for: .highlighted)
        //设置字大小
        vc.tabBarItem.setTitleTextAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 14)], for: .normal)
        
        let nv = JLLNavigationController(rootViewController: vc)
        
        return nv
    }
}
