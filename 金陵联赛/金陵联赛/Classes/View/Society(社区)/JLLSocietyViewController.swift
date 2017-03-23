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
    
    lazy var statusList = [String]()
    
    override func loadData() {
        for i in 0..<10{
            statusList.insert(i.description, at: 0)
        }
    }

    
    func showLeftButton(){
        
        let vc = JLLDemoViewController()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //刷新数据
//    func refreshData(){
//        //删除旧数据
//        self._dataArray?.removeAll()
//        
//        for _ in 1...5{
//            _dataArray?.append("\(Int(arc4random()%1000))")
//        }
//        self._tableView?.reloadData()
//        self.refreshControl.endRefreshing()
//    }
    
}

extension JLLSocietyViewController{
    override func setupUI() {
        super.setupUI()
        
        //创建navigationBar左侧按钮控件
        navItem.leftBarButtonItem = UIBarButtonItem(title: "我的消息", fontSize: 14.0, target: self, action: #selector(showLeftButton))
        
        //注册原型cell
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
}

//具体数据源方法实现
extension JLLSocietyViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)

        cell.textLabel?.text = statusList[indexPath.row]
        
        return cell
    }
}
