//
//  BundleExtension.swift
//  金陵联赛
//
//  Created by neo on 2017/3/5.
//  Copyright © 2017年 neo. All rights reserved.
//

import Foundation

extension Bundle{
    
    /// 返回命名空间
    var namespace: String{
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
