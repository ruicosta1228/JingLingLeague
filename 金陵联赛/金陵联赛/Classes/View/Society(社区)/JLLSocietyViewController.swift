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
        print("加载数据")
        //模拟延迟加载
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1){
            for i in 0..<15{
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
