//
//  JLLSocietyViewController.swift
//  金陵联赛
//
//  Created by neo on 2017/3/5.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

private let cellId = "cellId"

class JLLSocietyViewController: JLLBaseViewController {
    
    var search: UISearchBar = UISearchBar()
    
    lazy var statusList = [String]()
    
    lazy var model = JLLPlayerViewModel()
    
    override func loadData() {

//        model.login(completion: { (isSuccess) in
//            print(isSuccess)
//        })
        
        print("加载数据")
        //模拟延迟加载
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()){
            for i in 0..<3{
                if self.isPullup{
                    //追加
                    self.statusList.append("上拉 \(i)")
                }else{
                    //在最上方更新
                    self.statusList.insert(i.description, at: 0)
                }
            }
            //结束刷新控件
            self.refreshControl?.endRefreshing()
            //恢复上拉刷新标记
            self.isPullup = false
            //刷新表
            print("刷新表格")
            self.tableView?.reloadData()
        }
    }

    
    func showLeftButton(){
        
        let vc = JLLDemoViewController()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension JLLSocietyViewController{
    
    override func setupTableView() {
        super.setupTableView()
        
        //添加搜索框
        search.frame = CGRect(x: 0, y: 0, width: 0, height: 44)
        tableView?.tableHeaderView = search
        self.search.placeholder = "搜索"
        
        //创建navigationBar左侧按钮控件
        navItem.leftBarButtonItem = UIBarButtonItem(title: "", fontSize: 14.0, target: self, action: #selector(showLeftButton), Img: "search")
        
        //注册原型cell
        tableView?.register(UINib(nibName: "JLLStatusNormalCell", bundle: nil), forCellReuseIdentifier: cellId)
        
        //设置行高
        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.estimatedRowHeight = 300
        
        //取消分割线
        tableView?.separatorStyle = .none
    }
}

//具体数据源方法实现
extension JLLSocietyViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! JLLStatusCell

//        cell.textLabel?.text = statusList[indexPath.row]
        
        return cell
    }
    
    //cell点击事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        //向DetailViewController传值
        vc.title = "金陵联赛"
    }
}
