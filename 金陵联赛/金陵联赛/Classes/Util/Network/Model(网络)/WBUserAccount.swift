//
//  WBUserAccount.swift
//  金陵联赛
//
//  Created by neo on 2017/4/4.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

class WBUserAccount: UserAccount {
    
    var access_token: String?
    
    var uid: String?
    
    var expires_in: TimeInterval = 0
    
    override var description: String{
        return yy_modelDescription()
    }
}
