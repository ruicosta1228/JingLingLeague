//
//  WBLoginControllerViewController.swift
//  金陵联赛
//
//  Created by neo on 2017/4/2.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit
import SVProgressHUD

class WBLoginViewController: UIViewController {
    private lazy var webView = UIWebView()
    
    override func loadView() {
        view = webView
        
        view.backgroundColor = UIColor.white
        //取消滚屏
        webView.scrollView.isScrollEnabled = false
        
        //设置代理
        webView.delegate = self
        
        // 设置导航栏
        title = "登录新浪微博"
        // 导航栏按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", target: self, action: #selector(close))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "自动填充", target: self, action: #selector(autoFill))
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // 加载授权页面
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(WBAppKey)&redirect_uri=\(WBRedirectURI)"
        
        // 1> URL 确定要访问的资源
        guard let url = URL(string: urlString) else {
            return
        }
        
        // 2> 建立请求
        let request = URLRequest(url: url)
        
        // 3> 加载请求
        webView.loadRequest(request)
    }

    @objc func close() {
        SVProgressHUD.dismiss()
        //弹出新浪微博登录界面
        _ = navigationController?.popViewController(animated: true)
    }
    
    @objc func autoFill(){
        let js = "document.getElementById('userId').value = '549252496@qq.com'; " +
        "document.getElementById('passwd').value = 'ilovetreen3n4';"
        
        // 让 webview 执行 js
        webView.stringByEvaluatingJavaScript(from: js)
    }
}

extension WBLoginViewController: UIWebViewDelegate{
    
    //将要加载请求
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        // 1. 如果请求地址包含 http://baidu.com 不加载页面 ／ 否则加载页面
        // request.url?.absoluteString?.hasPrefix(WBRedirectURI) 返回的是可选项 true/false/nil
        if request.url?.absoluteString.hasPrefix(WBRedirectURI) == false {
            return true
        }
        
        // print("加载请求 --- \(request.url?.absoluteString)")
        // query 就是 URL 中 `?` 后面的所有部分
        // print("加载请求 --- \(request.url?.query)")
        // 2. 从 http://baidu.com 回调地址的`查询字符串`中查找 `code=`
        //    如果有，授权成功，否则，授权失败
        if request.url?.query?.hasPrefix("code=") == false {
            
            print("取消授权")
            close()
            
            return false
        }
        
        // 3. 从 query 字符串中取出 授权码
        // 代码走到此处，url 中一定有 查询字符串，并且 包含 `code=`
        // code=15be12d79321e474c599210ef637c978
        let code = request.url?.query?.substring(from: "code=".endIndex) ?? ""
        
        print("授权码 - \(code)")
        
        JLLNetworkingManager.shared.loadWBAccessToken(code: code){ (isSuccess) in
            if !isSuccess {
                SVProgressHUD.showInfo(withStatus: "网络请求失败")
                SVProgressHUD.dismiss()

            } else {
                SVProgressHUD.showInfo(withStatus: "登录成功")
                
                self.close()
                
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: JLLPlayerLoginSuccessNotification), object: nil)
                
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: VistorView2TableView), object: nil)
                
                SVProgressHUD.dismiss()
            }
        }
        
        return true
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        SVProgressHUD.show()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        SVProgressHUD.dismiss()
    }
}
