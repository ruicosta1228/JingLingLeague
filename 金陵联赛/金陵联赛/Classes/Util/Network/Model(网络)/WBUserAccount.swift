//
//  WBUserAccount.swift
//  金陵联赛
//
//  Created by neo on 2017/4/4.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

private let accountFile = "WB_userAccount.json"

class WBUserAccount: UserAccount {
    
    var access_token: String?
    
    var uid: String?
    
    var expires_in: TimeInterval = 0 {
        didSet {
            expiresDate = Date(timeIntervalSinceNow: expires_in)
        }
    }
    
    /// 过期日期
    var expiresDate: Date?
    
    override var description: String{
        return yy_modelDescription()
    }
    
    override init(){
        
        super.init()
        
        let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let path = (docDir as NSString).appendingPathComponent(accountFile)
        
        guard let data = NSData(contentsOfFile: path),
            let dict = try? JSONSerialization.jsonObject(with: data as Data, options: []) as? [String: AnyObject] else {
                return
        }
        
        //从沙盒json获取用户模型
        yy_modelSet(with: dict ?? [:])
        
        print("加载用户信息")
        
        // 测试过期日期 - 开发中，每一个分支都需要测试！
//         expiresDate = Date(timeIntervalSinceNow: -3600 * 24)
        //判断用户过期
        if expiresDate?.compare(Date()) != .orderedDescending {
            print("账户过期")
            
            // 清空 token
            access_token = nil
            uid = nil
            pId = nil
            
            // 删除帐户文件
            _ = try? FileManager.default.removeItem(atPath: path)
        }
        
//         print("账户正常")
    }
    
    func saveAccount() {
        
        // 1. 模型转字典
        var dict = (self.yy_modelToJSONObject() as? [String: AnyObject]) ?? [:]
        
        // 需要删除 expires_in 值
        dict.removeValue(forKey: "expires_in")
        
        //写入磁盘
        let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let filePath = (docDir as NSString).appendingPathComponent(accountFile)
        
        // 2. 字典序列化 data
        guard let data = try? JSONSerialization.data(withJSONObject: dict, options: [])
            else {
                return
        }
        
        // 3. 写入磁盘
        (data as NSData).write(toFile: filePath, atomically: true)
        
        print("用户账户保存成功 \(filePath)")
    }
}
