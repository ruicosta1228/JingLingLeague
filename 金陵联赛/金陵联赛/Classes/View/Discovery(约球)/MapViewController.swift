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

class MapViewController: JLLBaseViewController, MKMapViewDelegate {

//    let APIKey = "fd3f7f3e534d8e6bf159cfbd5e15ee16"
    
    var mainMapView: MKMapView!
    
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
        
        //返回按钮
        let returnBtn = UIButton()
        returnBtn.backgroundColor = UIColor.white
        returnBtn.setImage(UIImage(named: "return"), for: .normal)
        returnBtn.layer.borderColor = UIColor.black.cgColor
        returnBtn.frame = CGRect(x: 15, y: 30, width: 30, height: 30)
        returnBtn.addTarget(self, action: #selector(click), for: .touchUpInside)
        
        self.mainMapView = MKMapView()
        mainMapView.frame = self.view.frame
        self.view.addSubview(mainMapView)
        
        self.mainMapView.delegate = self
        
        mainMapView.addSubview(returnBtn)
        
        //设置地图类型为标准地图
        self.mainMapView.mapType = MKMapType.standard
        
        //设置地图范围
        let latDelta = 0.003
        let longDelta = 0.003
        let currentLocationSpan:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        //定义地图的中心区域和中心坐标
        //使用当前位置
        //        var center: CLLocation = locationManager.location!.coordinate
        //使用自定义位置
        let center:CLLocation = CLLocation(latitude: 32.179706, longitude: 118.705904)
        let currentRegion:MKCoordinateRegion = MKCoordinateRegion(center: center.coordinate, span: currentLocationSpan)
        
        self.mainMapView.setRegion(currentRegion, animated: true)
        
        //创建一个大头针对象
        let objectAnnotation = MKPointAnnotation()
        
        //设置大头针显示位置
        objectAnnotation.coordinate = CLLocationCoordinate2D(latitude: 32.179706, longitude: 118.705904)
        //设置点击大头针之后显示的标题
        objectAnnotation.title = "南大金陵足球场"
        //设置点击大头针之后显示的描述
        objectAnnotation.subtitle = "南大金陵足球场"
        //添加大头针
        self.mainMapView.addAnnotation(objectAnnotation)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        
        let reuserId = "pin"
        
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuserId) as? MKPinAnnotationView
        if pinView == nil {
            //创建一个大头针视图
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuserId)
            pinView?.canShowCallout = true
            pinView?.animatesDrop = true
            //设置大头针颜色
            pinView?.pinTintColor = UIColor.red
            //设置大头针点击注释视图的右侧按钮样式
            let addBtn = UIButton(type: .contactAdd)
            pinView?.rightCalloutAccessoryView = addBtn
            
            addBtn.addTarget(self, action: #selector(add), for: .touchUpInside)
        } else {
            pinView?.annotation = annotation
        }
        
        return pinView
    }
    
    func click() {
//        self.navigationController?.popToRootViewController(animated: true)
        self.navigationController?.popViewController(animated: true)
    }
    
    func add() {
        let alert = UIAlertController(title: "系统提示",
                                      message: "踢球or看球",
                                      preferredStyle: .actionSheet)
        let play = UIAlertAction(title: "踢球",
                                   style: .default,
                                   handler: {action in print("踢球")})
        let watch = UIAlertAction(title: "看球",
                                 style: .default,
                                 handler: {action in print("看球")})
        let cancel = UIAlertAction(title: "取消",
                                   style: .cancel,
                                   handler: nil)
        alert.addAction(play)
        alert.addAction(watch)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
