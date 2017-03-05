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
    }

}

extension JLLMainViewController{
    //设置子控制器
    func setupChildControllers(){
        let array = [
            ["clsName": "JLLSocietyViewController", "title": "社区", "imageName": ""],
            ["clsName": "JLLDiscoveryViewController", "title": "约球", "imageName": ""],
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
        
        let nv = JLLNavigationController(rootViewController: vc)
        
        return nv
    }
}
