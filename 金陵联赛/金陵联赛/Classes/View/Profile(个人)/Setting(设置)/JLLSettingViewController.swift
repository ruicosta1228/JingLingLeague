//
//  JLLSettingViewController.swift
//  金陵联赛
//
//  Created by Marco on 2017/3/30.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit
import PPNumberButtonSwift
import Charts
import Yashin
private let cellId = "cellId"

class JLLSettingViewController: JLLBaseViewController {
    @IBOutlet weak var tabview: UIView!
     let ability:[String] = ["速度","射门","身体","防守","意识"]
    
    @IBOutlet weak var topview: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func loadData() {
        print("加载数据")
    }
    

    
    
   
    func setupRadar(){
        let radarChart = Yashin(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        self.view.addSubview(radarChart)
        
        radarChart.set(keys:
            ["shoot", "pass", "dribble", "speed", "power", "stamina", "mentality"],
                       [([8,9,8,8,7,6,9], UIColor.green.withAlphaComponent(0.40))]
        )
    }
    
    
}




extension JLLSettingViewController{
    
    override func setupTableView() {
        super.setupTableView()
        setupRadar()
        self.view.backgroundColor = UIColor.white
        tableView?.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: tabBarController?.tabBar.bounds.height ?? 49, right: 0)
        navigationBar.isHidden = true
        //注册原型cell
        tableView?.register(UINib(nibName: "JLLSettingCell", bundle: nil), forCellReuseIdentifier: cellId)
        
        //设置行高
        tableView?.rowHeight = 75
        tableView?.estimatedRowHeight = 600
        
        //取消分割线
        tableView?.separatorStyle = .none
      
        tabview.addSubview(tableView!)
        
    }
}

//具体数据源方法实现
extension JLLSettingViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ability.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! JLLSettingCell
        //        cell.textLabel?.text = statusList[indexPath.row]
        
        return cell
}



}
