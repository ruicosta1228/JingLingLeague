//
//  JLLRadarViewController.swift
//  金陵联赛
//
//  Created by Marco on 2017/4/4.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit
import Charts

class JLLRadarViewController: JLLBaseViewController {
    
    @IBOutlet weak var radarChartView: RadarChartView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //隐藏导航栏
        navigationBar.isHidden = true
        setRadar()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //雷达图显示方法
    
    func setRadar(){
        
        
        
        let ys1 = Array(1..<6).map { x in return sin(Double(x) / 2.0 / 3.141 * 1.5) }
        
        
        let yse1 = ys1.enumerated().map { x, y in return RadarChartDataEntry(value: y) }
        
        
        let data = RadarChartData()
        let ds1 = RadarChartDataSet(values: yse1, label: "能力值")
        ds1.colors = [NSUIColor.red]
        data.addDataSet(ds1)
        
        self.radarChartView.data = data
        
        
        //        radarChartView.rotationEnabled = true
        radarChartView.webLineWidth = 1.0
        //        radarChartView.webColor = UIColor.gray  //网线颜色
        radarChartView.innerWebLineWidth = 1.0
        radarChartView.innerWebColor = UIColor.black  //圈线颜色
        
        //        radarChartView.xAxis.labelTextColor = UIColor.blue //外圈名字颜色
        radarChartView.xAxis.axisMaximum = 100.0  //最大值
        radarChartView.xAxis.axisMinimum = 0.0    //最小值
        //        radarChartView.yAxis.drawAxisLineEnabled = false
        
        radarChartView.chartDescription?.text = "Ability Radar Chart"
        radarChartView.animate(xAxisDuration: 0.0, yAxisDuration: 2.0, easingOption: .easeInBounce)
        
    }
    override func setupTableView() {
        self.view.backgroundColor = UIColor.white
        
        
    }
    
    
}
