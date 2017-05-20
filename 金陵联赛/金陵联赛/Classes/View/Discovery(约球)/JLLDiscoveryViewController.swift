//
//  JLLDiscoveryViewController.swift
//  金陵联赛
//
//  Created by neo on 2017/3/5.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

private let cellId = "cellId"

class JLLDiscoveryViewController: JLLBaseViewController {
    
    lazy var gameList = [String]()
    
    override func loadData() {
        print("加载数据")
        //模拟延迟加载
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()){
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
    }
    
    func showRightBtn() {
        let vc = DiscoveryStartViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showLeftBtn() {
        let vc = MyDiscoveryViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension JLLDiscoveryViewController {
    
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
        
        navItem.rightBarButtonItem = UIBarButtonItem(title: "", fontSize: 14.0, target: self, action: #selector(showRightBtn), Img: "compose")
        
        navItem.leftBarButtonItem = UIBarButtonItem(title: "我的约球", target: self, action: #selector(showLeftBtn))
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        setupUI()
    }
}

//具体数据源方法实现
extension JLLDiscoveryViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! DiscoveryStatusCell
        
        //        cell.textLabel?.text = gameList[indexPath.row]
        
        if indexPath.row == 0 {
            cell.backgroundImg.image = UIImage(named: "background1")
            cell.titleLabel.text = "兄弟，一起去看球!"
            cell.subtitleLabel.text = "5.1 南京大学浦口校区体育场"
        }
        if indexPath.row == 1 {
            cell.backgroundImg.image = UIImage(named: "background2")
            cell.titleLabel.text = "速来！一起踢球!"
            cell.subtitleLabel.text = "4.30 南京大学浦口校区体育场"
        }
        if indexPath.row == 2 {
            cell.backgroundImg.image = UIImage(named: "background3")
            cell.subtitleLabel.text = "4.29 南京大学浦口校区体育场"
        }
        
        return cell
    }
    
    //cell点击事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DiscoveryDetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

