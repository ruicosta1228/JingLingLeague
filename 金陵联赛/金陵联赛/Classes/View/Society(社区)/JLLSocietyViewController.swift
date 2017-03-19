//
//  JLLSocietyViewController.swift
//  金陵联赛
//
//  Created by neo on 2017/3/5.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

class JLLSocietyViewController: JLLBaseViewController,UITableViewDataSource,UITableViewDelegate {
    
    //设置当前的视图控制器遵守tableView的数据源协议和代理协议
    var _tableView:UITableView?
    var _dataArray:[String]?
    
    //刷新控制器
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置导航栏不透明
        self.navigationBar.isTranslucent = false
        
        _dataArray = [String]()
        for i in 1...5
        {
            _dataArray?.append("孙\(i)飞")
        }
        
        _tableView = UITableView(frame: CGRect(x: 0, y: 64, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width - 64), style:UITableViewStyle.plain)
        self.view.addSubview(_tableView!)
        
        _tableView?.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        _tableView?.separatorColor = UIColor.gray
        _tableView?.separatorInset = UIEdgeInsetsMake(30, 100, 100, 0)
        
        self._tableView?.tableFooterView = UIView()
        
        //设置数据源
        _tableView?.dataSource = self;
        //设置代理
        _tableView?.delegate = self;
        //        tableView(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        
        //添加刷新
        refreshControl.addTarget(self, action: #selector(JLLSocietyViewController.refreshData), for: .valueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "下拉刷新")
        _tableView?.addSubview(refreshControl)
        refreshData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {
        let cellid = "cellid"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellid)
        if cell == nil{
            cell = UITableViewCell(style: UITableViewCellStyle.default,reuseIdentifier: cellid)
        }
        cell!.textLabel?.text = _dataArray![indexPath.row]
        cell!.imageView?.image = UIImage(named: "/Users/yangyaodong/Desktop/JingLingLeague/金陵联赛/pic/timg.jpg")
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt index:IndexPath){
        let detail = DetailViewController()
        self.navigationController?.pushViewController(detail, animated: true)
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int)->Int
    {
        return _dataArray!.count;
    }
    
    func showLeftButton(){
        
        let vc = JLLDemoViewController()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //刷新数据
    func refreshData(){
        //删除旧数据
        self._dataArray?.removeAll()
        
        for _ in 1...5{
            _dataArray?.append("\(Int(arc4random()%1000))")
        }
        self._tableView?.reloadData()
        self.refreshControl.endRefreshing()
    }
    
}

extension JLLSocietyViewController{
    override func setupUI() {
        super.setupUI()
        
        //创建navigationBar左侧按钮控件
        navItem.leftBarButtonItem = UIBarButtonItem(title: "我的消息", fontSize: 14.0, target: self, action: #selector(showLeftButton))
    }
}
