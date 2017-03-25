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
    
    func composeStatus(){
        print("按钮监听方法")
    }
    
    lazy var composeButton = UIButton(frame:CGRect(x:0, y:0, width:100, height:30))
    
}

extension JLLMainViewController{
    //设置中间按钮
    func setupComposeButton(){
        composeButton.setImage(UIImage(named: "TabIcon"), for: .normal)
        
        let count = CGFloat(childViewControllers.count)
        let w = tabBar.bounds.width / count - 1 //容错点
        
        composeButton.frame = tabBar.bounds.insetBy(dx: 2 * w, dy: 0)
        tabBar.addSubview(composeButton)
        
        composeButton.addTarget(self, action: #selector(composeStatus), for: .touchUpInside)

    }
    
    //设置子控制器
    func setupChildControllers(){
        let  array: [[String: Any]] = [
            ["clsName": "JLLSocietyViewController", "title": "社区", "imageName": "",
              "visitorInfo": ["imageName": "", "message": "关注一些人，回这里看看有什么惊喜"]
            ],
            
            ["clsName": "JLLDiscoveryViewController", "title": "约球", "imageName": "",
             "visitorInfo": ["imageName": "visitordiscover_image_message", "message": "登录后，约人踢一场比赛吧哈哈哈哈哈哈哈哈"]
            ],
            
            ["clsName": "UIViewController"],
            
            ["clsName": "JLLScheduleViewController", "title": "比赛", "imageName": "",
             "visitorInfo": ["imageName": "visitordiscover_image_message", "message": "登陆后，看看球队的最近表现哈哈哈哈哈哈哈哈"]
            ],
            
            ["clsName": "JLLProfileViewController", "title": "个人", "imageName": "",
             "visitorInfo": ["imageName": "visitordiscover_image_profile", "message": "登陆后，将你自己展示给别人哈哈哈哈哈哈哈哈"]
            ],
        ]
        
        //测试数据格式是否正确
//        (array as NSArray).write(toFile: "/Users/salasoul/Desktop/demo.plist", atomically: true)
        
        var arrayM = [UIViewController]()
        
        for dict in array{
            arrayM.append(controller(dict: dict))
        }
        
        viewControllers = arrayM
    }
    
    
    private func controller(dict: [String: Any]) -> UIViewController{
        guard let clsName = dict["clsName"] as? String,
        let title = dict["title"] as? String,
        //let imageName = dict["imageName"],
        let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? JLLBaseViewController.Type,
        let visitorDict = dict["visitorInfo"] as? [String: String]
        
            else {
            
                return UIViewController()
            
        }
        
        let vc = cls.init()
        vc.title = title
        
        //设置控制器的访客信息字典
        vc.visitorInfoDictionary = visitorDict
        
        //设置选中高亮
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.blue], for: .highlighted)
        //设置字大小
        vc.tabBarItem.setTitleTextAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 14)], for: .normal)
        
        let nv = JLLNavigationController(rootViewController: vc)
        //设置标题颜色
        //nv.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.darkGray]
        return nv
    }
}
