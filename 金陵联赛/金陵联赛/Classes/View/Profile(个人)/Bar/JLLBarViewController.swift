//
//  JLLBarViewController.swift
//  金陵联赛
//
//  Created by Marco on 2017/4/4.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit
import Charts

class JLLBarViewController: JLLBaseViewController {
    var ability:[String]!
    @IBOutlet weak var barChartView: BarChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //隐藏导航栏
        navigationBar.isHidden = true
        
        ability = ["速度", "强壮", "花式", "体力", "射术"]
        let unitsSold = [20.0, 30.0, 40.0, 50.0, 60.0]


        
        setBar(dataPoints: ability, values: unitsSold)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setBar(dataPoints: [String], values: [Double]){
        barChartView.noDataText = "You need to provide data for the chart."
        
        
        //设置速度条
        var dataEntriesSpeed: [BarChartDataEntry] = []
        let dataEntrySpeed = BarChartDataEntry(x: 1.0, yValues: [values[0]])
        dataEntriesSpeed.append(dataEntrySpeed)
        let chartDataSetSpeed = BarChartDataSet(values:dataEntriesSpeed, label: dataPoints[0])
        chartDataSetSpeed.colors = [UIColor.blue]
        
        //设置强壮条
        var dataEntriesStrong: [BarChartDataEntry] = []
        let dataEntryStrong = BarChartDataEntry(x: 2.0, yValues: [values[1]])
        dataEntriesStrong.append(dataEntryStrong)
        let chartDataSetStrong = BarChartDataSet(values: dataEntriesStrong, label: dataPoints[1])
        chartDataSetStrong.colors = [UIColor.green]
        
        //设置花式条
        var dataEntriesSkill: [BarChartDataEntry] = []
        let dataEntrySkill = BarChartDataEntry(x: 3.0, yValues: [values[2]])
        dataEntriesSkill.append(dataEntrySkill)
        let chartDataSetSkill = BarChartDataSet(values: dataEntriesSkill, label: dataPoints[2])
        chartDataSetSkill.colors = [UIColor.orange]
        
        //设置体力条
        var dataEntriesStrength: [BarChartDataEntry] = []
        let dataEntryStrength = BarChartDataEntry(x: 4.0, yValues: [values[3]])
        dataEntriesStrength.append(dataEntryStrength)
        let chartDataSetStrength = BarChartDataSet(values: dataEntriesStrength, label: dataPoints[3])
        chartDataSetStrength.colors = [UIColor.red]
        
        //设置射术条
        var dataEntriesShoot: [BarChartDataEntry] = []
        let dataEntryShoot = BarChartDataEntry(x: 5.0, yValues: [values[4]])
        dataEntriesShoot.append(dataEntryShoot)
        let chartDataSetShoot = BarChartDataSet(values: dataEntriesShoot, label: dataPoints[4])
        chartDataSetShoot.colors = [UIColor.yellow]



            
            
        let chartData = BarChartData()
        chartData.addDataSet(chartDataSetSpeed)
        chartData.addDataSet(chartDataSetStrong)
        chartData.addDataSet(chartDataSetSkill)
        chartData.addDataSet(chartDataSetStrength)
        chartData.addDataSet(chartDataSetShoot)
        
        barChartView.rightAxis.drawLabelsEnabled = false
        barChartView.data = chartData
        barChartView.animate(xAxisDuration: 1.0, yAxisDuration: 1.0, easingOption: .easeInBounce)
    
        
        barChartView.xAxis.drawLabelsEnabled = false
           
    
            
        }

    
    //重写方法
    override func setupTableView() {
        self.view.backgroundColor = UIColor.white
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.barChartView.animate(xAxisDuration: 1.0, yAxisDuration: 1.0)
    }
    
   
    


}


