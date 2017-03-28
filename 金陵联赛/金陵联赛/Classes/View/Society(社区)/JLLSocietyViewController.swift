//
//  JLLSocietyViewController.swift
//  金陵联赛
//
//  Created by neo on 2017/3/5.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit
import AFNetworking

private let cellId = "cellId"

class JLLSocietyViewController: JLLBaseViewController {
    
    lazy var statusList = [String]()
    
    override func loadData() {
        //利用网络工具 获取服务器数据
//        let url = "http://localhost:8080/JingLingLeague/playerBased/login.html"
//        let url = "https://api.weibo.com/2/statuses/public_timeline.json"
//        let param = ["pName": "test", "pPassword": "test"]
//        let param = ["access_token": "2.00WdkIoC4orJzC303599f2c40_29ge"]

//        JLLNetworkingManager.shared.responseSerializer = AFHTTPResponseSerializer()
//        JLLNetworkingManager.shared.get(url, parameters: param, progress: nil, success: {(_, json) in
//            let data = json as! Data
//            let str = NSString.init(data: data, encoding: String.Encoding.utf8.rawValue)
//            print(str!)},
//                                        failure: {(_,error) in print("网络请求失败 \(error)")})
        
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

        cell.textLabel?.text = statusList[indexPath.row]
        
        return cell
    }
}
