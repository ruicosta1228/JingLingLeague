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
    var months:[String]!
    @IBOutlet weak var barChartView: BarChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //隐藏导航栏
        navigationBar.isHidden = true
        months = ["Jan", "Feb", "Mar", "Apr", "May"]
        
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0]
        
        setBar(dataPoints: months, values: unitsSold)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        func setBar(dataPoints: [String], values: [Double]) {
            barChartView.noDataText = "You need to provide data for the chart."
            var dataEntries: [BarChartDataEntry] = []
    
            for i in 0..<dataPoints.count {
                let dataEntry = BarChartDataEntry(x: Double(i), yValues: [values[i]])
                dataEntries.append(dataEntry)
            }
    
            let chartDataSet = BarChartDataSet(values: dataEntries, label: "能力值")
            let chartData = BarChartData(dataSet: chartDataSet)
            barChartView.data = chartData
            chartDataSet.colors = [UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 1)]
            barChartView.animate(xAxisDuration: 1.0, yAxisDuration: 1.0, easingOption: .easeInBounce)
    
            //使x轴位于下方
            barChartView.xAxis.labelPosition = .bottom
    
            
        }

    
    //重写方法
    override func setupTableView() {
        self.view.backgroundColor = UIColor.white
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.barChartView.animate(xAxisDuration: 1.0, yAxisDuration: 1.0)
    }
    
   
    


}


