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
    
    @IBAction func settingbtn(_ sender: Any) {
            let systemview = JLLSystemViewController()
            self.present(systemview, animated: true, completion: nil)
        
    }
   
    var months:[String]!
 
    
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
        
        let controller4 : JLLSettingViewController = JLLSettingViewController()
        controller4.title = "个人信息"
        controllerArray.append(controller4)
        

      

        let controller3 : JLLBarViewController = JLLBarViewController()

        controller3.title = "柱形能力图"
        controllerArray.append(controller3)
        
        
        let controller5 : JLLAbilityViewController = JLLAbilityViewController()
        controller5.title = "能力值"
        controllerArray.append(controller5)

        // Initialize scroll menu
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0.0, y: 10.0, width: self.view.frame.width, height: 650), pageMenuOptions: nil)
        
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
