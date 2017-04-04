//
//  JLLProfileViewController.swift
//  金陵联赛
//
//  Created by Marco on 2017/4/4.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit
import Charts
class JLLProfileViewController: JLLBaseViewController {

    @IBOutlet weak var radarChartView: RadarChartView!
    @IBOutlet weak var barChartView: BarChartView!
   
    var months:[String]!
    var abi:[String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        months = ["Jan", "Feb", "Mar", "Apr", "May"]

        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0]
        
        setChart(dataPoints: months, values: unitsSold)
        setRadar()
   
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
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
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInBounce)
        
        //使x轴位于下方
        barChartView.xAxis.labelPosition = .bottom

        
    }
    
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

        
        radarChartView.animate(xAxisDuration: 0.0, yAxisDuration: 2.0, easingOption: .easeInBounce)
        
    }
    
    override func setupTableView() {
        self.view.backgroundColor = UIColor.white
        
        
        //隐藏导航栏
        navigationBar.isHidden = true
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
