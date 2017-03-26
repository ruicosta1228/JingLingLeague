//
//  JLLDemoViewController.swift
//  金陵联赛
//
//  Created by neo on 2017/3/19.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

class JLLDemoViewController: JLLBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "第 \(navigationController?.childViewControllers.count ?? 0) 个"
    }

    func showNext(){
        let vc = JLLDemoViewController()
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension JLLDemoViewController {
    
    override func setupTableView() {
        super.setupTableView()
        //设置右侧控制器
        navItem.rightBarButtonItem = UIBarButtonItem(title: "下一个",  target: self, action: #selector(showNext))
    }
}
