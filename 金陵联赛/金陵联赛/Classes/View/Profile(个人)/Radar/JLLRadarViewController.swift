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
    private let ability:[String] = ["速度","射门","身体","防守","意识"]
    
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
        
        
        
        let ys1 = Array(1..<6).map { x in return 1.5*(Double(x) * 10.0 ) }
        
        
        let yse1 = ys1.enumerated().map { x, y in return RadarChartDataEntry(value: y) }
        
        
        let data = RadarChartData()
        let ds1 = RadarChartDataSet(values: yse1, label: "能力值")
        ds1.drawFilledEnabled = true
        let color = UIColor(red: 120/255, green: 117/255, blue: 199/255, alpha: 1)
        ds1.fillColor = color//填充颜色
        ds1.fillAlpha = 0.25 //填充透明度
        ds1.colors = [color]
        data.addDataSet(ds1)

        
        self.radarChartView.data = data
        
        
        
        radarChartView.webLineWidth = 0.25   //五条线宽度
        radarChartView.webColor = UIColor.gray //五条线颜色
        radarChartView.yAxis.drawLabelsEnabled = false
        
//        radarChartView.drawWeb = true
        
        radarChartView.innerWebLineWidth = 0.25  //圈线宽度
        radarChartView.innerWebColor = UIColor.gray //圈线颜色
        
        
        
        
        
        
        radarChartView.xAxis.axisMaximum = 100.0  //最大值
        radarChartView.xAxis.axisMinimum = 0.0    //最小值
        //        radarChartView.yAxis.drawAxisLineEnabled = false
        
        radarChartView.chartDescription?.text = "Ability Radar Chart"
        radarChartView.animate(xAxisDuration: 0.0, yAxisDuration: 1.0, easingOption: .easeInBounce)
        
    }
    override func setupTableView() {
        self.view.backgroundColor = UIColor.white
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.radarChartView?.animate(xAxisDuration: 0.0, yAxisDuration: 1.0)
    }
    
    
    
}
