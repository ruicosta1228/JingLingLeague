//
//  JLLRegisterViewController.swift
//  金陵联赛
//
//  Created by Salasoul on 2017/5/20.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

class JLLRegisterViewController: UIViewController {
    
    private lazy var registerView = RegisterView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    
     override func loadView() {
        view = registerView.register()
        
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        title = "注册"
        
        navigationController?.navigationBar.barTintColor = UIColor.black
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", target: self, action: #selector(close))
        

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(close), name: NSNotification.Name(rawValue: JLLPlayerRegisterSuccessNotification), object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc private func close(){
        dismiss(animated: true, completion: nil)
    }

}
