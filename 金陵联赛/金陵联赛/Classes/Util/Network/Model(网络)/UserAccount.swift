//
//  UserAccount.swift
//  金陵联赛
//
//  Created by neo on 2017/4/4.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

private let NM_accountFile = "userAccount.json"

enum LoginMethod{
    case NORMAL
    case WEIBO
    case TENCENT
}

class UserAccount: NSObject {
    //用户id
    var pId: String? 
    
    //微博登录信息
    public var wbAccount: WBUserAccount?
    
    //QQ登录信息
    public var qqAccount: QQUserAccount?
    
    var loginMethod: LoginMethod {
        if wbAccount != nil {
            return .WEIBO
        } else if qqAccount != nil {
            return .TENCENT
        } else {
            return .NORMAL
        }
    }
    
    override init(){
        super.init()
        
        let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let path = (docDir as NSString).appendingPathComponent(NM_accountFile)
        
        guard let data = NSData(contentsOfFile: path),
            let dict = try? JSONSerialization.jsonObject(with: data as Data, options: []) as? [String: AnyObject] else {
                return
        }
        
        //从沙盒json获取用户模型
        yy_modelSet(with: dict ?? [:])
        
        print("加载用户信息")
        
        switch loginMethod{
        case .WEIBO:
            print("微博登录")
            // 测试过期日期 - 开发中，每一个分支都需要测试！
//                wbAccount?.expiresDate = Date(timeIntervalSinceNow: -3600 * 24)
            //判断用户过期
            if wbAccount?.expiresDate?.compare(Date()) != .orderedDescending {
                print("账户过期")
                
                // 清空 token
                wbAccount = nil
                
                pId = nil
                // 删除帐户文件
                _ = try? FileManager.default.removeItem(atPath: path)
            }
        case .NORMAL:
            print("普通登录")

        default:
            print("未登录")
        }
        
    }
    
    override var description: String{
        return yy_modelDescription()
    }
    
    func saveAccount() {
        
        // 1. 模型转字典
        let dict = (self.yy_modelToJSONObject() as? [String: AnyObject]) ?? [:]
        
        // 需要删除 expires_in 值
//        dict.removeValue(forKey: "expires_in")
        
        //写入磁盘
        let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let filePath = (docDir as NSString).appendingPathComponent(NM_accountFile)
        
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
