//
//  JLLSettingViewController.swift
//  金陵联赛
//
//  Created by Marco on 2017/3/30.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

private let cellId = "cellId"

class JLLSettingViewController: JLLBaseViewController {

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

extension JLLSettingViewController{
    
    override func setupTableView() {
        super.setupTableView()
        
        //创建navigationBar右侧按钮控件
        navItem.leftBarButtonItem = UIBarButtonItem(title: "返回", fontSize: 14.0, target: self, action: #selector(showLeftButton))
        
        //注册原型cell
        tableView?.register(UINib(nibName: "JLLSettingCell", bundle: nil), forCellReuseIdentifier: cellId)
        
        //设置行高
        tableView?.rowHeight = 160
        tableView?.estimatedRowHeight = 600
        
        //取消分割线
        tableView?.separatorStyle = .none
    }
}

//具体数据源方法实现
extension JLLSettingViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! JLLSettingCell
        
        cell.textLabel?.text = statusList[indexPath.row]
        
        return cell
    }

}
