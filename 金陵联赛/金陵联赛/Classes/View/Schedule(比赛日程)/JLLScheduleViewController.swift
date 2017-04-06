//
//  JLLSocietyViewController.swift
//  金陵联赛
//
//  Created by neo on 2017/3/5.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit
import PageMenu
private let cellId = "cellId"

class JLLScheduleViewController: JLLBaseViewController {
    
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
        
        let controller1 : JLLMatchViewController = JLLMatchViewController()
        
        controller1.title = "我的比赛"
        controllerArray.append(controller1)
        
        let controller2 : JLLMatchViewController = JLLMatchViewController()
        
        controller2.title = "欧冠"
        controllerArray.append(controller2)
        
        let controller3 : JLLMatchViewController = JLLMatchViewController()
        
        controller3.title = "英超"
        controllerArray.append(controller3)
        
        
        let controller4 : JLLMatchViewController = JLLMatchViewController()
        
        controller4.title = "德甲"
        controllerArray.append(controller4)
        
        
        let controller5 : JLLMatchViewController = JLLMatchViewController()
        
        controller5.title = "西甲"
        controllerArray.append(controller5)
        
        
        let controller6 : JLLMatchViewController = JLLMatchViewController()
        
        controller6.title = "中超"
        controllerArray.append(controller6)
        
        // Initialize scroll menu
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0.0, y: 64.0, width: self.view.frame.width, height: 600), pageMenuOptions: nil)
        
        print(self.view.frame.height)
        
        self.view.addSubview(pageMenu!.view)
        
    }
    
    
    //重写方法
    override func setupTableView() {
        self.view.backgroundColor = UIColor.white
       
        setPage()
        
    }

    
    
    
}
