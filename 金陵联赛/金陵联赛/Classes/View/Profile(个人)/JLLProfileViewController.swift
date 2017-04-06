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
            let settingview = JLLSettingViewController()
            self.present(settingview, animated: true, completion: nil)
        
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
        
        let controller1 : JLLRadarViewController = JLLRadarViewController()

        controller1.title = "雷达能力图"
        controllerArray.append(controller1)
        
        let controller2 : JLLPieViewController = JLLPieViewController()

        controller2.title = "饼状能力图"
        controllerArray.append(controller2)

        let controller3 : JLLBarViewController = JLLBarViewController()

        controller3.title = "柱形能力图"
        controllerArray.append(controller3)

        // Initialize scroll menu
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0.0, y: 200.0, width: self.view.frame.width, height: 600), pageMenuOptions: nil)
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
