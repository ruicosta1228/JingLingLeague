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
    
    let search: UISearchBar = UISearchBar()
    
    let sv: UIScrollView = UIScrollView()
    
    lazy var society_model: JLLSocietyViewModel = JLLSocietyViewModel()
    
    var images = [UIImage]()
    
//    var timer: Timer?
    
    var rollingTime: TimeInterval = 2
    
//    var rollingEnable: Bool = false {
//        willSet {
//            if newValue != rollingEnable{
//                if newValue {
//                    startTimer()
//                } else {
//                    stopTimer()
//                }
//            }
//        }
//    }
    
//    var currentPage = 0 {
//        didSet {
//            upade()
//        }
//    }
    
    lazy var statusList = [String]()
    
    lazy var model = JLLPlayerViewModel()
    
    override func loadData() {

//        model.login(completion: { (isSuccess) in
//            print(isSuccess)
//        })
        society_model.society_init()
        print("加载数据")
        //模拟延迟加载
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()){
//            for i in 0..<3{
//                if self.isPullup{
//                    //追加
//                    self.statusList.append("上拉 \(i)")
//                }else{
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

    
    func showLeftButton(){
        
        let vc = JLLDemoViewController()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension JLLSocietyViewController{
    
    override func setupTableView() {
        super.setupTableView()

        //添加scrollview
        sv.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.width / 1242 * 582)
        
        let w = view.frame.width * 3
        let h = view.frame.width / 1242 * 582
        sv.contentSize = CGSize(width: w, height: h)
        sv.isPagingEnabled = true
        sv.showsHorizontalScrollIndicator = false
        sv.showsVerticalScrollIndicator = false
        sv.delegate = self
        sv.contentOffset = CGPoint(x: self.view.frame.width, y: 0)
        
        sv.addSubview(UIImageView())
        sv.addSubview(UIImageView())
        sv.addSubview(UIImageView())
        images = [UIImage(named: "page1")!, UIImage(named: "page2")!, UIImage(named: "page3")!]
        (sv.subviews[0] as! UIImageView).image = images.last//UIImage(named: "page1")
        (sv.subviews[1] as! UIImageView).image = images[0]//UIImage(named: "page2")
        (sv.subviews[2] as! UIImageView).image = images[1]//UIImage(named: "page3")
        
        for i in 0..<3 {
            let imgView = sv.subviews[i] as! UIImageView
            imgView.contentMode = .scaleAspectFill
            imgView.clipsToBounds = true
            imgView.frame = CGRect(x: CGFloat(i) * view.frame.width, y: 0, width: view.frame.width, height: sv.frame.height)
        }
        
        sv.isPagingEnabled = true
        
        tableView?.addSubview(sv)
        
        //创建navigationBar左侧按钮控件
        navItem.leftBarButtonItem = UIBarButtonItem(title: "", fontSize: 14.0, target: self, action: #selector(showLeftButton), Img: "search")
        
        //注册原型cell
        tableView?.register(UINib(nibName: "JLLStatusNormalCell", bundle: nil), forCellReuseIdentifier: cellId)
        
        //设置行高
        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.estimatedRowHeight = 300
        
        //取消分割线
        tableView?.separatorStyle = .none
        
        //将scrollview放到第一个cell上面
        tableView?.tableHeaderView = sv
    }

}

//具体数据源方法实现
extension JLLSocietyViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return society_model.society.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! JLLStatusCell

//        cell.textLabel?.text = statusList[indexPath.row]
        cell.composeImage.contentMode = UIViewContentMode.scaleAspectFit
        cell.composeImage.image = UIImage(named: society_model.society[indexPath.row].composeImage!)
        cell.userImage.contentMode = UIViewContentMode.scaleAspectFit
        cell.userImage.image = UIImage(named: society_model.society[indexPath.row].userImage!)
        
        cell.nameLabel.text = society_model.society[indexPath.row].nameLabel
        cell.timeLabel.text = society_model.society[indexPath.row].timeLabel
        cell.titleLabel.text = society_model.society[indexPath.row].titleLabel
        cell.statusLabel.text = society_model.society[indexPath.row].statusLabel
        
        return cell
    }
    
    //cell点击事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        //向DetailViewController传值
        vc.title = "详情"
    }
}
