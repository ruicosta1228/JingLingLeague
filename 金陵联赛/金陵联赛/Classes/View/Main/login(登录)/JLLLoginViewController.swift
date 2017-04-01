//
//  JLLLoginViewController.swift
//  金陵联赛
//
//  Created by neo on 2017/4/1.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

class JLLLoginViewController: UIViewController {
    private lazy var loginView = UIView()
    
    override func loadView() {
        view = loginView
        
        view.backgroundColor = UIColor.white
        
        title = "登录"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", target: self, action: #selector(close))
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @objc private func close(){
        dismiss(animated: true, completion: nil)
    }

}
