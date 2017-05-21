//
//  registerView.swift
//  金陵联赛
//
//  Created by Salasoul on 2017/5/20.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

class RegisterView: UIView {

    @IBAction func registerBtn(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: JLLPlayerRegisterSuccessNotification), object: nil)
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: JLLPlayerLoginSuccessNotification), object: nil)
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: VistorView2TableView), object: nil)
    }

    @IBAction func loginBtn(_ sender: Any) {
    }
    
    func register() -> RegisterView {
        let nib = UINib(nibName: "register", bundle: nil)
        let v = nib.instantiate(withOwner: nil, options: nil)[0] as! RegisterView
        return v
    }
    
}
