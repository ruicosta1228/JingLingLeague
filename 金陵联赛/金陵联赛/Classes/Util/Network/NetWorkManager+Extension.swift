//
//  NetWorkManager+Extension.swift
//  金陵联赛
//
//  Created by neo on 2017/3/29.
//  Copyright © 2017年 neo. All rights reserved.
//

import Foundation
import AFNetworking

extension JLLNetworkingManager{
    
    /// 封装player登录请求方法
    ///
    /// - Parameter completion: 回调函数 返回的是包含player属性的字典
    func playerLoginList(completion: @escaping (_ list: NSDictionary, _ isSuccess: Bool)->Void) {
        //利用网络工具 获取服务器数据 封装了闭包
        let url = "http://localhost:8080/JingLingLeague/playerBased/login.html"
        //        let url = "https://api.weibo.com/2/statuses/public_timeline.json"
        let param = ["pName": "test", "pPassword": "test"]
        //        let param = ["access_token": "2.00WdkIoC4orJzC303599f2c40_29ge"]
        
        request(URLString: url, parameters: param as [String : AnyObject], completion: {(json, isSuccess) in
//            let str = NSString.init(data: json as! Data, encoding: String.Encoding.utf8.rawValue)
            if !isSuccess{
                completion([:], false)
                
                return
            }
            
//            let dict = try! JSONSerialization.jsonObject(with: json , options:.mutableContainers) as! NSDictionary
            let dict = json as! NSDictionary
            
            guard let result = dict["player"] else{
                completion([:], false)
                
                return
            }
            
            completion(result as! NSDictionary, isSuccess)
        })

    }
}

//第三方登录相关方法
extension JLLNetworkingManager{
    func loadWBAccessToken(code: String, completion: @escaping (_ isSuccess:Bool)->Void){
        let urlString = "https://api.weibo.com/oauth2/access_token"
        
        let params = ["client_id": WBAppKey,
                      "client_secret": WBAppSecret,
                      "grant_type": "authorization_code",
                      "code": code,
                      "redirect_uri": WBRedirectURI]
        
        request(method: .POST, URLString: urlString, parameters: params as [String : AnyObject], completion: { (json, isSuccess) in
            self.userAccount.yy_modelSet(with: (json as? [String: Any]) ?? [:])
            
            print(self.userAccount)
            
            self.userAccount.saveAccount()
            
            completion(isSuccess)
        })
    }
}
