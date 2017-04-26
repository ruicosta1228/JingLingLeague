//
//  JLLPieViewController.swift
//  金陵联赛
//
//  Created by Marco on 2017/4/4.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit
import Charts

class JLLPieViewController: JLLBaseViewController {
    
    private let ability:[String] = ["速度","射门","身体","防守","意识"]
    
    @IBOutlet weak var pieChartView: PieChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //隐藏导航栏
        navigationBar.isHidden = true
        setPie()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //饼图显示方法
    func setPie(){
//        let ys1 = Array(1..<6).map { x in return sin(Double(x) / 2.0 / 3.141 * 1.5) * 100.0 }
        let ys1 = [20.0, 20.0, 20.0, 20.0,20.0]

        let yse1 = ys1.enumerated().map { x, y in return PieChartDataEntry(value: y, label: ability[x]) }
        
        let data = PieChartData()
        let ds1 = PieChartDataSet(values: yse1, label: "能力值")
        
        ds1.colors = ChartColorTemplates.vordiplom()
        
        data.addDataSet(ds1)
        
        let paragraphStyle: NSMutableParagraphStyle = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        paragraphStyle.lineBreakMode = .byTruncatingTail
        paragraphStyle.alignment = .center
        let centerText: String =  "by Marco"
        //      设置中间文字属性
        
        
        //        centerText.setAttributes([NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 15.0)!, NSParagraphStyleAttributeName: paragraphStyle], range: NSMakeRange(0, centerText.length))
        //        centerText.addAttributes([NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 13.0)!, NSForegroundColorAttributeName: UIColor.gray], range: NSMakeRange(10, centerText.length - 10))
        //        centerText.addAttributes([NSFontAttributeName: UIFont(name: "HelveticaNeue-LightItalic", size: 13.0)!, NSForegroundColorAttributeName: UIColor(red: 51 / 255.0, green: 181 / 255.0, blue: 229 / 255.0, alpha: 1.0)], range: NSMakeRange(centerText.length - 19, 19))
        
        pieChartView.centerText = centerText
        pieChartView.animate(xAxisDuration: 0.0, yAxisDuration: 1.0, easingOption: .easeInBounce)
        pieChartView.data = data
        
        pieChartView.chartDescription?.text = "能力饼状图"    }
    
    //重写方法
    override func setupTableView() {
        self.view.backgroundColor = UIColor.blue
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.pieChartView.animate(xAxisDuration: 0.0, yAxisDuration: 1.0)
    }


}
