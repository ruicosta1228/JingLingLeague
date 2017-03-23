//
//  JLLBaseViewController.swift
//  金陵联赛
//
//  Created by neo on 2017/3/5.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

//OC中不支持多继承，使用协议替代
class JLLBaseViewController: UIViewController {
    //如果用户没有登录就不创建
    var tableView: UITableView?
    
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64))
    
    lazy var navItem = UINavigationItem()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    override var title: String?{
        didSet {
            navItem.title = title
        }
    }
    
    func loadData(){
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension JLLBaseViewController{
    func setupUI(){
        
        self.view.backgroundColor = UIColor.white
        
        setupNavigationBar()
        
        setupTableView()
        
    }
    
    private func setupNavigationBar(){
        
        view.addSubview(navigationBar)
        
        navigationBar.items = [navItem]
        
        //设置navigationBar背景色
        navigationBar.barTintColor = UIColor.lightGray
        
        //设置title颜色
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.darkGray]
        

    }
    
    private func setupTableView(){
        tableView = UITableView(frame: view.bounds, style: .plain)
        
        view.insertSubview(tableView!, belowSubview: navigationBar)
        
        //设置数据源与代理，让子类直接实现数据源方法
        tableView?.dataSource = self
        tableView?.delegate = self
    }
}

extension JLLBaseViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    //基类准备方法
    //子类不需要super
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
