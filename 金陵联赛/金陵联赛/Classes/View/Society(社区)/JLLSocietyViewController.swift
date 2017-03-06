//
//  JLLSocietyViewController.swift
//  金陵联赛
//
//  Created by neo on 2017/3/5.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

class JLLSocietyViewController: JLLBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func showLeftButton(){
        print(#function)
        
        let vc = UIViewController()
                
        navigationController?.pushViewController(vc, animated: true)
    }

}

extension JLLSocietyViewController{
    override func setupUI() {
        super.setupUI()

        //创建navigationBar左侧按钮控件
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "我的消息", fontSize: 14.0, target: self, action: #selector(showLeftButton))
    }
}
