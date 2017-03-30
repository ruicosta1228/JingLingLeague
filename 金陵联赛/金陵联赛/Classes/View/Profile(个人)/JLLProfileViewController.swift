//
//  JLLProfileViewController.swift
//  金陵联赛
//
//  Created by neo on 2017/3/5.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

class JLLProfileViewController: JLLBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func showRightButton(){
        
        let vc = JLLDemoViewController()
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension JLLProfileViewController{
    
    override func setupTableView() {
        
        
        //创建navigationBar右侧按钮控件
        navItem.rightBarButtonItem = UIBarButtonItem(title: "设置", fontSize: 14.0, target: self, action: #selector(showRightButton))
        
        //添加子视图
        let underview = UITableView(frame: CGRect(x: 0, y: 200, width: view.bounds.width, height: 800))
        underview.separatorStyle = UITableViewCellSeparatorStyle.none
        
        let u = ProfileBottomView.profileBottomView()
        let v = ProfileTopView.profileTopView()
        
        
        self.view.addSubview(underview)
        underview.addSubview(u)
        self.view.insertSubview(v, belowSubview: underview)
        
        
        

    }
}
