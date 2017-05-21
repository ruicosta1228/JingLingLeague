//
//  JLLSystemViewController.swift
//  金陵联赛
//
//  Created by Marco on 2017/4/7.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

private let NM_accountFile = "userAccount.json"

class JLLSystemViewController: JLLBaseViewController {
    var switchBtn:UISwitch!
    var switchBtn2:UISwitch!
   
    @IBAction func quitbtn(_ sender: Any) {
        //点击弹窗
        let alert = UIAlertController(title: "系统提示",
                                      message: "您确定要退出登录吗？",
                                      preferredStyle: .alert)
        let quit = UIAlertAction(title: "退出",
                                 style: .default,
                                 handler: {action in self.logoff()})
        let cancel = UIAlertAction(title: "取消",
                                   style: .cancel,
                                   handler: nil)
        alert.addAction(quit)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func logoff(){
        JLLNetworkingManager.shared.userAccount.pid = nil
        
        let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let path = (docDir as NSString).appendingPathComponent(NM_accountFile)
        // 删除帐户文件
        _ = try? FileManager.default.removeItem(atPath: path)
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: TableView2VisitorView), object: nil)
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    override func setupTableView() {
        self.view.backgroundColor = UIColor.white
        
        self.title = "系统设置"
        myswitch()
        
        
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


