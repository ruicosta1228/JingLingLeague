//
//  JLLStatus.swift
//  金陵联赛
//
//  Created by Salasoul on 2017/4/6.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

class JLLStatus: NSObject {

    var id: Int64 = 0
    //信息内容
    var text: String?
    
    //用户
    var user: JLLUser?
    
    override var description: String {
        return yy_modelDescription()
    }
    
}
