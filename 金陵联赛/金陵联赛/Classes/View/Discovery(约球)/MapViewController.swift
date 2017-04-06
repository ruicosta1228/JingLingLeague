//
//  MapViewController.swift
//  金陵联赛
//
//  Created by 杨耀东 on 17/3/15.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: JLLBaseViewController {

//    let APIKey = "fd3f7f3e534d8e6bf159cfbd5e15ee16"
    
    var mapView: MKMapView!
    
    //定位管理器
    let locationManager: CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}

extension MapViewController {
    
    override func setupTableView() {
        view.backgroundColor = UIColor.white
        title = "约球"
        
        self.mapView = MKMapView()
        mapView.frame = self.view.frame
        self.view.addSubview(mapView)
        
        //设置地图类型为标准地图
        self.mapView.mapType = MKMapType.standard
        
        //设置地图范围
        let latDelta = 0.005
        let longDelta = 0.005
        let currentLocationSpan:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        //定义地图的中心区域和中心坐标
        //使用当前位置
        //        var center: CLLocation = locationManager.location!.coordinate
        //使用自定义位置
        let center:CLLocation = CLLocation(latitude: 32.176597, longitude: 118.706076)
        let currentRegion:MKCoordinateRegion = MKCoordinateRegion(center: center.coordinate, span: currentLocationSpan)
        
        self.mapView.setRegion(currentRegion, animated: true)
        
        //创建一个大头针对象
        let objectAnnotation = MKPointAnnotation()
        
        //设置大头针显示位置
        objectAnnotation.coordinate = CLLocationCoordinate2D(latitude: 32.179706, longitude: 118.705904)
        //设置点击大头针之后显示的标题
        objectAnnotation.title = "南大金陵足球场"
        //设置点击大头针之后显示的描述
        objectAnnotation.subtitle = "南大金陵足球场"
        //添加大头针
        self.mapView.addAnnotation(objectAnnotation)
        
    }
    
}
