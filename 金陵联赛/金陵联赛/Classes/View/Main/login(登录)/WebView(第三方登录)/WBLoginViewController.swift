//
//  WBLoginControllerViewController.swift
//  金陵联赛
//
//  Created by neo on 2017/4/2.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

class WBLoginViewController: UIViewController {
    private lazy var webView = UIWebView()
    
    override func loadView() {
        view = webView
        
        view.backgroundColor = UIColor.white
        //取消滚屏
        webView.scrollView.isScrollEnabled = false
        
        // 设置导航栏
        title = "登录新浪微博"
        // 导航栏按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", target: self, action: #selector(close))
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @objc private func close() {
        
        //弹出新浪微博登录界面
        _ = navigationController?.popViewController(animated: true)
    }
}
