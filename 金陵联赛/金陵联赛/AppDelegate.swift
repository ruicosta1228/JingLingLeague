//
//  AppDelegate.swift
//  金陵联赛
//
//  Created by neo on 2017/3/5.
//  marco
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
        window?.backgroundColor = UIColor.white
        
        window?.rootViewController = JLLMainViewController()
        window?.makeKeyAndVisible()
        return true
    }

}

