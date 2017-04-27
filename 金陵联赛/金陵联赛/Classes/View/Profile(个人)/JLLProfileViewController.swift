//
//  JLLProfileViewController.swift
//  金陵联赛
//
//  Created by Marco on 2017/4/4.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit
import PageMenu


class JLLProfileViewController: JLLBaseViewController {
    
    

    var pageMenu : CAPSPageMenu?
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
       
    func setPage(){
        // Initialize view controllers to display and place in array
        var controllerArray : [JLLBaseViewController] = []
        
        let controller1 : JLLSettingViewController = JLLSettingViewController()
        controller1.title = "个人能力值"
        controllerArray.append(controller1)
        

      

        let controller2 : JLLAbilityViewController = JLLAbilityViewController()

        controller2.title = "个人信息"
        controllerArray.append(controller2)
        
        
        let controller3 : JLLSystemViewController = JLLSystemViewController()
        controller3.title = "系统设置"
        controllerArray.append(controller3)

        // Initialize scroll menu
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0.0, y: 20.0, width: self.view.frame.width, height: 650), pageMenuOptions: nil)
        
        print(self.view.frame.height)
        
        self.view.addSubview(pageMenu!.view)
        
    }
    
    
    
    //重写方法
    override func setupTableView() {
        self.view.backgroundColor = UIColor.white
        //隐藏导航栏
        navigationBar.isHidden = true
        
        setPage()
        
    }


}
