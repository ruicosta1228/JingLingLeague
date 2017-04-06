//
//  JLLMainViewController.swift
//  金陵联赛
//
//  Created by neo on 2017/3/5.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

class JLLMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.barTintColor = UIColor.black
        
        setupChildControllers()
        
        setupComposeButton()
        
        //设置新特性
        setupNewFeatureView()
        
        //设置代理
        delegate = self
        
        //注册通知
        NotificationCenter.default.addObserver(self, selector: #selector(playerLogin), name: NSNotification.Name(rawValue: JLLPlayerShouldLoginNotification), object: nil)
    }
    
    deinit{
        //注销通知
        NotificationCenter.default.removeObserver(self)
    }
    
    //登录监听方法
    @objc private func playerLogin(n: Notification){
        print("用户登录通知\(n)")
        
        let nav = UINavigationController(rootViewController: JLLLoginViewController())
        
        present(nav, animated: true, completion: nil)
    }
    
    func composeStatus(){
        if JLLNetworkingManager.shared.userLogon {
            print("发布")
        
            //判断是否登录
        
            //实例化视图
            let v = JLLComposeView.composeView()
        
            //显示视图
            v.show()
        }
    }
    
    lazy var composeButton = UIButton(frame:CGRect(x:0, y:0, width:100, height:30))
    
}

extension JLLMainViewController: UITabBarControllerDelegate {
    
    /// 将要选择TabBarItem 点击tabBar加载数据跳转到顶部
    ///
    /// - Parameters:
    ///   - tabBarController: tabBarController
    ///   - viewController: 目标控制器
    /// - Returns: 是否切换到目标控制器
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        print("将要切换到 \(viewController)")
        
        //获取控制器在数组中的索引
        let index = childViewControllers.index(of: viewController)
        
        //获取当前索引
        if selectedIndex == 0 && index == selectedIndex {
            print("点击首页")
            
            //滚动到顶部
            //获取控制器
            let nav = childViewControllers[0] as! UINavigationController
            
            let vc = nav.childViewControllers[0] as! JLLSocietyViewController
            
            vc.tableView?.setContentOffset(CGPoint(x: 0, y: -64), animated: true)
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: {
                vc.loadData()

            })
        }
        
        //通过判断是不是UIViewController，来屏蔽如果点歪composeButton到一个空的UIViewController的bug
        //这个方法判断是不是该类，且不包含其子类
        return !viewController.isMember(of: UIViewController.self)
    }
}

//新特性
extension JLLMainViewController {

    func setupNewFeatureView() {

        let v = isNew ? JLLNewFeatureView().newFeature() : JLLWelcomeView()
        v.frame = view.bounds

        view.addSubview(v)

    }

    var isNew: Bool {
        return true
    }
}

extension JLLMainViewController{
    
    //设置中间按钮
    func setupComposeButton(){
        composeButton.setImage(UIImage(named: "compose"), for: .normal)
        
        let count = CGFloat(childViewControllers.count)
        let w = tabBar.bounds.width / count 
        
        composeButton.frame = tabBar.bounds.insetBy(dx: 2 * w, dy: 0)
        tabBar.addSubview(composeButton)
        
        composeButton.addTarget(self, action: #selector(composeStatus), for: .touchUpInside)
        
    }
    
    //设置子控制器
    func setupChildControllers(){
        
        //获取沙盒json路径
        let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let jsonPath = (docDir as NSString).appendingPathComponent("main.json")
        
        //加载data
        var data = NSData(contentsOfFile: jsonPath)
        
        //判断data是否有内容
        if data == nil {
            //从bundle加载data
            let path = Bundle.main.path(forResource: "main.json", ofType: nil)
            data = NSData(contentsOfFile: path!)
        }
        
        
        //从bundle加载配置的json
        guard let array = try? JSONSerialization.jsonObject(with: data! as Data, options: []) as? [[String: Any]]
        else{
            return
        }
        
        //遍历数组，循环创建控制器数组
        var arrayM = [UIViewController]()
        
        for dict in array!{
            arrayM.append(controller(dict: dict))
        }
        
        //设置tabBar的子控制器
        viewControllers = arrayM
    }
    
    
    private func controller(dict: [String: Any]) -> UIViewController{
        guard let clsName = dict["clsName"] as? String,
        let title = dict["title"] as? String,
        let imageName = dict["imageName"],
        let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? JLLBaseViewController.Type,
        let visitorDict = dict["visitorInfo"] as? [String: String]
        
            else {
            
                return UIViewController()
            
        }
        
        let vc = cls.init()
        vc.title = title
        
        //设置控制器的访客信息字典
        vc.visitorInfoDictionary = visitorDict
        
        vc.tabBarItem.image = UIImage(named: imageName as! String + "_normal")
        vc.tabBarItem.selectedImage = UIImage(named: imageName as! String + "_selected")?.withRenderingMode(.alwaysOriginal)
        
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.init(red: 167 / 255, green: 167 / 255, blue: 167 / 255, alpha: 1)], for: .normal)
        //设置选中高亮
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)], for: .highlighted)
        //设置字大小
        vc.tabBarItem.setTitleTextAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 14)], for: .normal)
        
        let nv = JLLNavigationController(rootViewController: vc)
        //设置标题颜色
        //nv.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.darkGray]
        return nv
    }
}
