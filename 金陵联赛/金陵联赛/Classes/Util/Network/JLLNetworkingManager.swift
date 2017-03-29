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
    static let shared = JLLNetworkingManager()
    
    //是否成功
    private var isSuccesss = false
    
    //封装get和post请求
    ///
    /// - Parameters:
    ///   - method: 枚举类型 GET / POST
    ///   - URLString: URL
    ///   - parameters: 参数字典
    func request(method: JLLHTTPMethod = .GET, URLString: String, parameters: [String: AnyObject]){
        if method == .GET {
            get(URLString, parameters: parameters, progress: nil, success: {(_, json) in
                            let data = json as! Data
                            let str = NSString.init(data: data, encoding: String.Encoding.utf8.rawValue)
                            print(str!)
                            self.isSuccesss = true
                            print(self.isSuccesss)
            }, failure: {(_,error) in
                            print("网络请求失败 \(error)")
                            self.isSuccesss = false
                            print(self.isSuccesss)
            })
            
        }else{
            post(URLString, parameters: parameters, progress: nil, success: {(_, json) in
                let data = json as! Data
                let str = NSString.init(data: data, encoding: String.Encoding.utf8.rawValue)
                print(str!)
                self.isSuccesss = true
                print(self.isSuccesss)
            }, failure: {(_,error) in
                print("网络请求失败 \(error)")
                self.isSuccesss = false
                print(self.isSuccesss)
            })
        }
    }
    
}
