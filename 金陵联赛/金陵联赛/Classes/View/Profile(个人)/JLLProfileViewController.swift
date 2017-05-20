//
//  JLLProfileViewController.swift
//  金陵联赛
//
//  Created by Marco on 2017/4/4.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit
import Yashin
private let cellId = "cellId"

class JLLProfileViewController: JLLBaseViewController {
    
    

    
    @IBOutlet weak var tabview: UIView!
    
    let ability:[String] = ["速度","射门","身体","防守","意识","速度","加速","拦截","平衡","花式","弹跳","积极",]
    let abilitynum: [String] = ["91","95","85","55","90","95","95","80","95","99","70","50"]

    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupRadar(){
        let radarChart = Yashin(frame: CGRect(x: 150.0, y: 30.0, width: 200, height: 180))
        print(self.view.frame)
        self.view.addSubview(radarChart)
        radarChart.backgroundColor = UIColor.clear
        radarChart.lineColor = UIColor.white
        
        radarChart.set(keys:
            ["射术", "传球", "速度", "力量", "耐力"],
                       [([8,9,8,7,6], UIColor.green.withAlphaComponent(0.40))]
        )
        
    }
    
    func showRightButton(){
        
        let vc = JLLSystemViewController()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
  



}
extension JLLProfileViewController{
    
    override func setupTableView() {
        super.setupTableView()
        tableView?.frame = CGRect(x: 0, y: 40, width: tabview.bounds.width, height: UIScreen.main.bounds.height)
        tableView?.backgroundColor = UIColor.darkGray
        tabview.backgroundColor = UIColor.darkGray
        setupRadar()
        self.view.backgroundColor = UIColor.black
        tableView?.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: tabBarController?.tabBar.bounds.height ?? 49, right: 0)
        //注册原型cell
        tableView?.register(UINib(nibName: "JLLSettingCell", bundle: nil), forCellReuseIdentifier: cellId)
        
        //设置行高
        tableView?.rowHeight = 30
        tableView?.estimatedRowHeight = 600
        
        //取消分割线
        tableView?.separatorStyle = .none
        
        //创建navigationBar左侧按钮控件
        navItem.rightBarButtonItem = UIBarButtonItem(title: "", fontSize: 14.0, target: self, action: #selector(showRightButton), Img: "setting_image")

        tabview.addSubview(tableView!)
        
    
      
        
    }
}

//具体数据源方法实现
extension JLLProfileViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ability.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! JLLSettingCell
        
        cell.cell.text = ability[indexPath.row]
        cell.cellnum.text = abilitynum[indexPath.row]
        cell.progress.trackTintColor = UIColor.black
        cell.progress.transform = CGAffineTransform(scaleX: 1.0, y: 3.0)
        
         cell.progress.setProgress(Float(Double(cell.cellnum.text!)! / Double(100)), animated: true)
        
       
        if indexPath.row % 2 == 0
        {
            cell.contentView.backgroundColor = UIColor.darkGray
        }
        else{
            cell.contentView.backgroundColor = UIColor.darkGray
        }
        //通过数值判断背景颜色
        for _ in 0..<10
        {
            if Int(cell.cellnum.text!)!  >= 90
            {
                cell.progress.progressTintColor = UIColor.green
            }
            else if Int(cell.cellnum.text!)! < 60
            {
                cell.progress.progressTintColor = UIColor.red
            }
            else
            {
                cell.progress.progressTintColor = UIColor.yellow
            }
        }
        
        return cell
    }
    
    
    
}



