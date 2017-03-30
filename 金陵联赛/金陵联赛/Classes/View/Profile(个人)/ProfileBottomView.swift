//
//  ProfileBottomView.swift
//  金陵联赛
//
//  Created by Marco on 2017/3/30.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

class ProfileBottomView: UIView {

    class func profileBottomView() -> ProfileBottomView {
        
        let nib = UINib(nibName: "ProfileBottomView", bundle: nil)
        
        let v = nib.instantiate(withOwner: nil, options: nil)[0] as! ProfileBottomView
        
        v.frame = UIScreen.main.bounds
        
        return v
    }

}
