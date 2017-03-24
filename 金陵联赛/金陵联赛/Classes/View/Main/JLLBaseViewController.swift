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
    //用户登录标记
    var userLogon = false
    
    //如果用户没有登录就不创建
    var tableView: UITableView?
    //刷新控件
    var refreshControl: UIRefreshControl?
    //上拉刷新标记
    var isPullup = false
    
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64))
    
    lazy var navItem = UINavigationItem()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        //加载数据
        loadData()
    }
    
    override var title: String?{
        didSet {
            navItem.title = title
        }
    }
    
    func loadData(){
        //子类不实现方法，默认关闭刷新控件
        refreshControl?.endRefreshing()
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
        
        //取消自动缩进
        automaticallyAdjustsScrollViewInsets = false
        
        setupNavigationBar()
        
        userLogon ? setupTableView() : setupVisitorView()
        
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
        
        //设置内容缩进
        //将内容从navigationBar和tabBar中挤出来
        tableView?.contentInset = UIEdgeInsets(top: navigationBar.bounds.height, left: 0, bottom: tabBarController?.tabBar.bounds.height ?? 49, right: 0)
        
        //刷新控件初始化
        refreshControl = UIRefreshControl()
        
        tableView?.addSubview(refreshControl!)
        
        //添加监听方法
        refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
    }
    
    private func setupVisitorView(){
        let visitorView = UIView(frame: view.bounds)
        
        visitorView.backgroundColor = UIColor.white
        
        view.insertSubview(visitorView, belowSubview: navigationBar)
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
    
    //显示最后一行时候上拉刷新
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //判断是否是最后一行
        let row = indexPath.row
        
        let section = tableView.numberOfSections - 1
        
        if row < 0 || section < 0 {
            return
        }
        
        let count = tableView.numberOfRows(inSection: section)
        
        //如果是最后一行，同时没有上拉刷新
        if(row == (count - 1) && !isPullup){
            print("上拉刷新")
            isPullup = true
            
            loadData()
        }
    }
}
