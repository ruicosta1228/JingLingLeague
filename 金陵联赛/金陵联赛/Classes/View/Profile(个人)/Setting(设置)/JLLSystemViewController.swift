//
//  JLLSystemViewController.swift
//  金陵联赛
//
//  Created by Marco on 2017/4/7.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

class JLLSystemViewController: JLLBaseViewController {
    @IBAction func quitbtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "系统设置"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showLeftButton(){
        
        self.dismiss(animated: true, completion: nil)    }

    
    override func setupTableView() {
        self.view.backgroundColor = UIColor.white
        
        //创建navigationBar左侧按钮控件
        navItem.leftBarButtonItem = UIBarButtonItem(title: "返回", fontSize: 14.0, target: self, action: #selector(showLeftButton))
        
        
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


