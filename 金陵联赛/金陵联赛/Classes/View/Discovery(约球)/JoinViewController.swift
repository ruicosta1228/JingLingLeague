//
//  JoinViewController.swift
//  金陵联赛
//
//  Created by 杨耀东 on 17/3/15.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

private let cellId = "cellId"

class JoinViewController: JLLBaseViewController {

    lazy var gameList = [String]()
    
    override func loadData() {
        print("加载数据")
        //模拟延迟加载
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1){
            for i in 0..<3{
//                if self.isPullup{
//                    //追加
//                    self.gameList.append("上拉 \(i)")
//                }else{
                    //在最上方更新
                    self.gameList.insert(i.description, at: 0)
//                }
            }
            //结束刷新控件
            self.refreshControl?.endRefreshing()
            //恢复上拉刷新标记
//            self.isPullup = false
            //刷新表
            print("刷新表格")
            self.tableView?.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "金陵联赛"

    }
    
}

extension JoinViewController{
    
    override func setupTableView() {
        super.setupTableView()
        
        //注册原型cell
        tableView?.register(UINib(nibName: "DiscoveryCell", bundle: nil), forCellReuseIdentifier: cellId)
        
        //设置行高
        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.estimatedRowHeight = 100
        tableView?.rowHeight = 190

        //取消分割线
        tableView?.separatorStyle = .none
    }
}

//具体数据源方法实现
extension JoinViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! DiscoveryStatusCell
        
//        cell.textLabel?.text = gameList[indexPath.row]
        
        return cell
    }
    
    //cell点击事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}

