//
//  JLLProfileView.swift
//  金陵联赛
//
//  Created by Marco on 2017/3/30.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

class ProfileTopView: UIView {

    class func profileTopView() -> ProfileTopView {
        
        
        
        let nib = UINib(nibName: "ProfileTopView", bundle: nil)
        
        let v = nib.instantiate(withOwner: nil, options: nil)[0] as! ProfileTopView
        
        v.frame = UIScreen.main.bounds
        
        return v
    }
    @IBAction func btnClick(_ sender: Any) {
        
    }

}
