//
//  WBUserAccount.swift
//  金陵联赛
//
//  Created by neo on 2017/4/4.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

private let accountFile = "WB_userAccount.json"

class WBUserAccount: NSObject {
    
    var access_token: String?
    
    var uid: String?
    
    var expires_in: TimeInterval = 0 {
        didSet {
            expiresDate = Date(timeIntervalSinceNow: expires_in)
        }
    }
    
    /// 过期日期
    var expiresDate: Date?
    
    //用户昵称
    var screen_name: String?
    /// 用户头像地址（大图），180×180像素
    var avatar_large: String?
    
    override var description: String{
        return yy_modelDescription()
    }
    
}
