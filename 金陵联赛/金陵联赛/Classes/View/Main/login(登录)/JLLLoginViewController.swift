//
//  JLLLoginViewController.swift
//  金陵联赛
//
//  Created by neo on 2017/4/1.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

class JLLLoginViewController: UIViewController {
    private lazy var loginView = LoginView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    
    override func loadView() {
        view = loginView
        
        view.backgroundColor = UIColor.white
        
        title = "登录"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", target: self, action: #selector(close))
        
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(loginByWeibo), name: NSNotification.Name(rawValue: JLLPlayerShouldLoginByWeiboNotification), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(loginByTencentQQ), name: NSNotification.Name(rawValue: JLLPlayerShouldLoginByTencentQQNotification), object: nil)
    }
    
    deinit{
        //注销通知
        NotificationCenter.default.removeObserver(self)
    }

    //退出登录界面
    @objc private func close(){
        dismiss(animated: true, completion: nil)
    }

}

//第三方登录事件
extension JLLLoginViewController {
    @objc func loginByWeibo(){
        
        let vc = WBLoginViewController()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func loginByTencentQQ(){
        
        print("qq login")
    }
}
