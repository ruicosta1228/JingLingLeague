//
//  JLLSystemViewController.swift
//  金陵联赛
//
//  Created by Marco on 2017/4/7.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

class JLLSystemViewController: JLLBaseViewController {
    var switchBtn:UISwitch!
    var switchBtn2:UISwitch!
   
    @IBAction func quitbtn(_ sender: Any) {
        //点击弹窗
        let alertView = UIAlertView()
        alertView.title = "系统提示"
        alertView.message = "您确定要退出登录吗？"
        alertView.addButton(withTitle: "取消")
        alertView.addButton(withTitle: "确定")
        alertView.cancelButtonIndex=0
        alertView.delegate=self;
        alertView.show()
    }
    
    
    //通过点击判断是否退出
    func alertView(alertView:UIAlertView, clickedButtonAtIndex buttonIndex: Int){
        if(buttonIndex==alertView.cancelButtonIndex){
            print("用户取消")
        }
        else
        {
            print("点击了确认")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "系统设置"
        myswitch()
        


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    override func setupTableView() {
        self.view.backgroundColor = UIColor.white
        

        
        
    }
    
    func myswitch(){
        // 创建UISwitch开关
        switchBtn = UISwitch()
        self.view.addSubview(switchBtn)
        
        // 设置位置（开关大小无法设置）
        switchBtn.center = CGPoint(x: 350, y:210)
        switchBtn.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        
        // 设置默认值
        switchBtn.isOn = true
        
        switchBtn2 = UISwitch()
        self.view.addSubview(switchBtn2)
        
        // 设置位置（开关大小无法设置）
        switchBtn2.center = CGPoint(x: 350, y:270)
        switchBtn2.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        
        // 设置默认值
        switchBtn2.isOn = false
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


