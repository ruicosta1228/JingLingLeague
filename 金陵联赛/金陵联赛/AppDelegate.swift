//
//  AppDelegate.swift
//  金陵联赛
//
//  Created by neo on 2017/3/5.
//  marco
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //取得用户授权显示通知
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: { (success, error) in
            print("授权" + (success ? "成功" : "识别"))
        })
        
        window = UIWindow()
        window?.backgroundColor = UIColor.white
        
        window?.rootViewController = JLLMainViewController()
        window?.makeKeyAndVisible()
        
        loadAppInfo()
        
        return true
    }

}

//设置方向支持
extension AppDelegate {
    @objc(application:supportedInterfaceOrientationsForWindow:) func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return .portrait
    }
}

//从服务器加载应用程序信息
extension AppDelegate {
    func loadAppInfo(){
        //模拟异步
        DispatchQueue.global().async {
            let url = Bundle.main.url(forResource: "main.json", withExtension: nil)
            let data = NSData(contentsOf: url!)
            //写入磁盘
            let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            let jsonPath = (docDir as NSString).appendingPathComponent("main.json")
            //直接保存在沙盒，等待程序下一次启动使用
            data?.write(toFile: jsonPath, atomically: true)
            
            print("应用程序加载完毕 路径：\(jsonPath)")
        }
        
        
    }
}
