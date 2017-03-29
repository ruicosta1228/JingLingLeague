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
        
        responseSerializer = AFHTTPResponseSerializer()
        request(URLString: url, parameters: param as [String : AnyObject], completion: {(json, isSuccess) in
//            let str = NSString.init(data: json as! Data, encoding: String.Encoding.utf8.rawValue)
            
            let dict = try! JSONSerialization.jsonObject(with: json as! Data, options:.mutableContainers) as! NSDictionary
            
            guard let result = dict["player"] else{
                return
            }
            
            completion(result as! NSDictionary, isSuccess)
        })

    }
}
