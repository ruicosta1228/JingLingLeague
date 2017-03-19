//
//  JLLNavigationControllerViewController.swift
//  金陵联赛
//
//  Created by neo on 2017/3/5.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

class JLLNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //隐藏默认的bar
        navigationBar.isHidden = true
        
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        //如果不是栈底控制器，就隐藏
        if childViewControllers.count > 0{
            viewController.hidesBottomBarWhenPushed = true
        
            if let vc = viewController as? JLLBaseViewController {
            
                var title = "返回"
                
                //只有一个子控制器时，显示栈底控制器的标题
                if childViewControllers.count == 1{
                    title = childViewControllers.first?.title ?? "返回"
                }
                
                vc.navItem.leftBarButtonItem = UIBarButtonItem(title: title,  target: self, action: #selector(popToParent))
            }
        }
        
        super.pushViewController(viewController, animated: true)
    }
    
    func popToParent() {
        popViewController(animated: true)
    }

}
