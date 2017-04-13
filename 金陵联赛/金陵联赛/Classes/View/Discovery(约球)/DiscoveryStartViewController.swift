//
//  DiscoveryStartViewController.swift
//  金陵联赛
//
//  Created by Salasoul on 2017/4/13.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

private let cellId = "cellId"

class DiscoveryStartViewController: JLLBaseViewController {

    let sv: UIScrollView = UIScrollView()
    let label: UILabel? = nil
    var img = UIImage()
    var inputLabel: UILabel?
    var text: UITextField?
    let ball: UIImageView? = nil
    var startBtn: UIButton? = nil
    
    lazy var gameList = [String]()
    
    override func loadData() {
        print("加载数据")
        
        gameList = ["计算机系队长",
                    "4月14日下午2点",
                    "4月14日",
                    "踢野球",
                    "单位",
                    "无上限",
                    "学府路8号南京大学金陵学院",
                    "足球队训练，今天的主题是射门练习",
                    "孙一飞、杨耀东、王凌翔"]
        
        //模拟延迟加载
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()){
//            //            for i in 0..<9{
//            //                //                if self.isPullup{
//            //                //                    //追加
//            //                //                    self.gameList.append("上拉 \(i)")
//            //                //                }else{
//            //                //在最上方更新
//            //                self.gameList.insert(i.description, at: 0)
//            //                //                }
//            //            }
//            //结束刷新控件
            self.refreshControl?.endRefreshing()
//            //恢复上拉刷新标记
//            //            self.isPullup = false
//            //刷新表
//            print("刷新表格")
//            self.tableView?.reloadData()
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func click() {
        let alert = UIAlertController(title: "系统提示",
                                      message: "已成功发起",
                                      preferredStyle: .alert)
        let start = UIAlertAction(title: "确定",
                                 style: .default,
                                 handler: {action in self.navigationController?.popToRootViewController(animated: true)})

        alert.addAction(start)
        
        self.present(alert, animated: true, completion: nil)
        
    }

}

extension DiscoveryStartViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        cell.imageView?.image = UIImage(named: "discovery_normal")
        cell.textLabel?.text = gameList[indexPath.row]
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        return cell
    }
    
    //cell点击事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let map = MapViewController()
        if indexPath.row == 6 {
            self.navigationController?.pushViewController(map, animated: true)
        }
    }
}

extension DiscoveryStartViewController {
    override func setupTableView() {
        super.setupTableView()
        
        //底部按钮
        startBtn = UIButton()
        startBtn?.frame = CGRect(x: 0, y: self.view.frame.height - 40, width: self.view.frame.width, height: 40)
        startBtn?.backgroundColor = UIColor.red
        startBtn?.setTitle("我要发起活动", for: UIControlState.normal)
        startBtn?.addTarget(self, action: #selector(click), for: .touchUpInside)
        self.view.addSubview(startBtn!)
        
        sv.frame = CGRect(x: 0, y: self.navigationBar.frame.height, width: self.view.frame.width, height: self.view.frame.width / 1242 * 600)
        self.view.addSubview(sv)
        img = UIImage(named: "background1")!
        sv.addSubview(UIImageView())
        let imgView = sv.subviews[0] as! UIImageView
        imgView.image = UIImage(named: "background1")
        imgView.contentMode = .scaleAspectFill
        imgView.frame = CGRect(x: 0, y: 0, width: sv.frame.width, height: sv.frame.height)
        
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        tableView?.frame = CGRect(x: 0, y: sv.frame.height, width: self.view.frame.width, height: self.view.frame.height)
        
        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.estimatedRowHeight = 100
        tableView?.rowHeight = 40
    }
}
