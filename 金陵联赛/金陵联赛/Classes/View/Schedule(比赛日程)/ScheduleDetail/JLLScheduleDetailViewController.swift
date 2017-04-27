//
//  JLLScheduleDetailViewController.swift
//  金陵联赛
//
//  Created by Marco on 2017/4/27.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

private let cellId = "cellId"

let ability: [String] = ["1","2","3"]
class JLLScheduleDetailViewController: JLLBaseViewController {
    @IBOutlet weak var tabview: UIView!

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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension JLLScheduleDetailViewController{
    
    override func setupTableView() {
        super.setupTableView()
        self.view.backgroundColor = UIColor.white
        tableView?.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: tabBarController?.tabBar.bounds.height ?? 49, right: 0)
        
        //注册原型cell
        tableView?.register(UINib(nibName: "DetailCell", bundle: nil), forCellReuseIdentifier: cellId)
        
        //设置行高
        tableView?.rowHeight = 550
        tableView?.estimatedRowHeight = 600
        
        //取消分割线
        tableView?.separatorStyle = .none
        
        tabview.addSubview(tableView!)
        
    }
}

//具体数据源方法实现
extension JLLScheduleDetailViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ability.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! DetailCell
        if indexPath.row == 0{
            cell.cellimage.image = UIImage(named: "Schedule")
        }
        if indexPath.row == 1 {
            cell.cellimage.image = UIImage(named: "Schedule1")
        }
        if indexPath.row == 2 {
            cell.cellimage.image = UIImage(named: "Schedule2")
        }
        return cell
    }
    
    
    
}



