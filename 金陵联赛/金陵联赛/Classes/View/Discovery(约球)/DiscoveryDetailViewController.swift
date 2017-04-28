//
//  DiscoveryDetailViewController.swift
//  金陵联赛
//
//  Created by Salasoul on 2017/4/13.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

private let cellId = "cellId"

class DiscoveryDetailViewController: JLLBaseViewController {

    let sv: UIScrollView = UIScrollView()
    let label: UILabel? = nil
    var img = UIImage()
    var inputLabel: UILabel?
    var text: UITextField?
    let ball: UIImageView? = nil
    var joinBtn: UIButton? = nil
    
    let picList = ["leader",
                   "time",
                   "deadline",
                   "type",
                   "unit",
                   "max",
                   "location",
                   "intro",
                   "member"]
    
    lazy var gameList = [String]()
    
    override func loadData() {
        print("加载数据")
        
        gameList = ["组织者",
        "时间",
        "报名截止",
        "类型",
        "单位",
        "单位上限",
        "活动地址",
        "活动介绍",
        "报名人员"]
        
        //模拟延迟加载
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()){
//            for i in 0..<9{
//                //                if self.isPullup{
//                //                    //追加
//                //                    self.gameList.append("上拉 \(i)")
//                //                }else{
//                //在最上方更新
//                self.gameList.insert(i.description, at: 0)
//                //                }
//            }
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func click() {
        let alert = UIAlertController(title: "系统提示",
                                      message: "呼叫发起用户",
                                      preferredStyle: .alert)
        let join = UIAlertAction(title: "呼叫",
                                  style: .default,
                                  handler: {action in self.call()})
        let cancel = UIAlertAction(title: "取消",
                                   style: .cancel,
                                   handler: nil)
        
        alert.addAction(join)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
    }

    func call() {
        let phone = "13505228821"
        UIApplication.shared.openURL(URL(string: "tel://"+"\(phone)")!)
    }
    
    func btn_click() {
        joinBtn?.backgroundColor = UIColor.gray
        joinBtn?.setTitle("已加入", for: UIControlState.normal)
        joinBtn?.isSelected = true
        let alert = UIAlertController(title: "系统提示",
                                      message: "加入成功",
                                      preferredStyle: .alert)

        let cancel = UIAlertAction(title: "确定",
                                   style: .default,
                                   handler: nil)
        
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension DiscoveryDetailViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        cell.imageView?.image = UIImage(named: picList[indexPath.row])
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
        if indexPath.row == 0 {
            click()
        }
    }

}

extension DiscoveryDetailViewController {
    override func setupTableView() {
        super.setupTableView()
        
        //底部按钮
        joinBtn = UIButton()
        joinBtn?.frame = CGRect(x: 0, y: self.view.frame.height - 40, width: self.view.frame.width, height: 40)
        joinBtn?.backgroundColor = UIColor.red
        joinBtn?.setTitle("我要参加活动", for: UIControlState.normal)
        joinBtn?.addTarget(self, action: #selector(btn_click), for: .touchUpInside)
        self.view.addSubview(joinBtn!)
        
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
