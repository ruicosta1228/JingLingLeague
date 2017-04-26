//
//  JLLBarViewController.swift
//  金陵联赛
//
//  Created by Marco on 2017/4/4.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit
import Charts
import Yashin

class JLLBarViewController: JLLBaseViewController {
    var ability:[String]!
    @IBOutlet weak var barChartView: BarChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //隐藏导航栏
        navigationBar.isHidden = true
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func setupTableView() {
        self.view.backgroundColor = UIColor.white
        //隐藏导航栏
        navigationBar.isHidden = true
        setupRadar()
    }
    
    func setupRadar(){
        let radarChart = Yashin(frame: self.view.frame)
        self.view.addSubview(radarChart)

        radarChart.set(keys:
            ["shoot", "pass", "dribble", "speed", "power"],
            [([8,9,8,8,7], UIColor.green.withAlphaComponent(0.40))]
        )
    }
    
    
   
    


}


