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
        let url = "http://120.24.80.73:8080/jinglingleague/playerBased/login.html"
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
    
    //微博普通登录
    func login_normal(input: String?, password: String?,  completion: @escaping (_ dict: Bool)->()){
        let url = "http://120.24.80.73:8080/jinglingleague/user/login_normal.json?"
        
        let param = ["input" : input , "password" : password]
        
        request(URLString: url, parameters: param as [String : AnyObject], completion: { (json, isSuccess) in
            if !isSuccess {
                
                
                completion(false)
                
                return
            }
            
            self.userAccount.yy_modelSet(with: json as! [String : AnyObject])
            
            self.userAccount.saveAccount()
            
            print(self.userAccount)
            
            completion(true)
        })
    }
    
    //微博登录成功后与自己的服务器交互获得pid和access_key
    func loginByWeibo(name: String, selfi: String, completion: @escaping (_ dict: [String: AnyObject])->()){
        let url = "http://120.24.80.73:8080/jinglingleague/user/login_weibo.json?"
        
        let param = ["name" : name , "selfi" : selfi]
        
        request(URLString: url, parameters: param as [String : AnyObject], completion: {(json, isSuccess) in
            if !isSuccess {
                completion([:])
                
                return
            }
            
            completion(json as! [String : AnyObject] )
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
            
            if isSuccess {
                self.userAccount.wbAccount = WBUserAccount()
            
                self.userAccount.wbAccount?.yy_modelSet(with: (json as? [String: Any]) ?? [:])
            
                self.loadWBUserInfo(completion: { (dict) in
                    
                    self.userAccount.wbAccount?.yy_modelSet(with: dict)
                    
//                    self.userAccount.saveAccount()
//                    
//                    print(self.userAccount)
                    
                    self.loginByWeibo(name: self.userAccount.wbAccount?.screen_name ?? "", selfi: self.userAccount.wbAccount?.avatar_large ?? "", completion: { (json) in
                        
                            self.userAccount.yy_modelSet(with: json)
                        
                            self.userAccount.saveAccount()

                            print(self.userAccount)

                            //异步网络工具要完成才能使用闭包回调
                            completion(isSuccess)
                    })

                })
            }
        })
    }
    
    func loadWBUserInfo(completion: @escaping (_ dict: [String: AnyObject])->()) {
        
        guard let uid = userAccount.wbAccount?.uid else {
            return
        }
        
        let urlString = "https://api.weibo.com/2/users/show.json"
        
        let params = ["uid": uid,
                      "access_token": userAccount.wbAccount?.access_token]
        
        // 发起网络请求
        request(URLString: urlString, parameters: params as [String : AnyObject]) { (json, isSuccess) in
            // 完成回调
            completion((json as? [String: AnyObject]) ?? [:])
        }
    }
}
