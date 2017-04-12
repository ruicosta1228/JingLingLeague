//
//  JLLMatchViewController.swift
//  金陵联赛
//
//  Created by Marco on 2017/4/6.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

private let cellId = "cellId"

class JLLMatchViewController: JLLBaseViewController {
    
    
    lazy var statusList = [String]()
    
    lazy var model: JLLScheduleViewModel = JLLScheduleViewModel()
    
    override func loadData() {
        print("加载数据")
        
        model.matches_init()
        //模拟延迟加载
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()){
//            for i in 0..<2{
//
//                if self.isPullup{
//                    //追加
//                    self.statusList.append("上拉 \(i)")
//                }
//                else{
//                    //在最上方更新
//                    self.statusList.insert(i.description, at: 0)
//                }
//            }
            //结束刷新控件
            self.refreshControl?.endRefreshing()
            //恢复上拉刷新标记
            self.isPullup = false
            //刷新表
            print("刷新表格")
            self.tableView?.reloadData()
        }
    }
    
}

    
    


extension JLLMatchViewController{
    
    override func setupTableView() {
        super.setupTableView()
        tableView?.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: tabBarController?.tabBar.bounds.height ?? 49, right: 0)
        navigationBar.isHidden = true
        //注册原型cell
        tableView?.register(UINib(nibName: "JLLScheduleCell", bundle: nil), forCellReuseIdentifier: cellId)
        
        //设置行高
        tableView?.rowHeight = 160
        tableView?.estimatedRowHeight = 600
        
        //取消分割线
        tableView?.separatorStyle = .none
    }
}

//具体数据源方法实现
extension JLLMatchViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.matches.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! JLLScheduleCell
        cell.Team1Name.text = model.matches[indexPath.row].team1_name
        cell.Team2Name.text = model.matches[indexPath.row].team2_name
        
        cell.Team1Logo.contentMode = UIViewContentMode.scaleAspectFit
        cell.Team1Logo.image = UIImage(named: model.matches[indexPath.row].team1_icon!)
        cell.Team2Logo.contentMode = UIViewContentMode.scaleAspectFit
        cell.Team2Logo.image = UIImage(named: model.matches[indexPath.row].team2_icon!)
        
        cell.VS.text = model.matches[indexPath.row].result
        cell.Time.text = model.matches[indexPath.row].time

        //        cell.textLabel?.text = statusList[indexPath.row]
        
        return cell
    }

}
