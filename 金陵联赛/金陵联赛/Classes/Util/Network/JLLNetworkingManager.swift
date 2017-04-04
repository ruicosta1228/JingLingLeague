//
//  JLLNetworkingManager.swift
//  金陵联赛
//
//  Created by neo on 2017/3/28.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit
import AFNetworking

enum JLLHTTPMethod {
    case GET
    case POST
}

class JLLNetworkingManager: AFHTTPSessionManager {
    //单例模式
    static let shared: JLLNetworkingManager = {
        // 实例化对象
        let instance = JLLNetworkingManager()
        
        // 设置响应反序列化支持的数据类型
//        instance.responseSerializer = AFHTTPResponseSerializer()

        instance.responseSerializer.acceptableContentTypes?.insert("text/plain")
        instance.responseSerializer.acceptableContentTypes?.insert("text/html")

        // 返回对象
        return instance
    }()
    
    //用户登录模型
    lazy var userAccount = WBUserAccount()
    
    //用户登录标记
    var userLogon: Bool{
        return userAccount.pId != nil
    }
    
    /// 封装GET\POST方法
    ///
    /// - Parameters:
    ///   - method: 枚举类型 GET / POST
    ///   - URLString: URL
    ///   - parameters: 参数字典
    ///   - completion: 完成回调[json(字典数组),是否成功]
    func request(method: JLLHTTPMethod = .GET, URLString: String, parameters: [String: AnyObject], completion:@escaping (_ json: Any?, _ isSuccess: Bool)->Void){
        let success = {(task:URLSessionDataTask, json: Any?)->Void in
            
            completion(json, true)
        }
        
        let failure = {(task:URLSessionDataTask?, error: Error)->Void in
            
            print("网络请求错误\(error)")
            
            completion(error, false)
        }
        
        if method == .GET {
            get(URLString, parameters: parameters, progress: nil, success: success, failure: failure)
            
        }else{
            post(URLString, parameters: parameters, progress: nil, success: success, failure: failure)
        }
    }
    
}
