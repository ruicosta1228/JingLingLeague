//
//  JLLDiscoveryViewController.swift
//  金陵联赛
//
//  Created by neo on 2017/3/5.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit
import pop

class JLLDiscoveryViewController: JLLBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showRightButton() {
        let jv = JoinViewController()
        navigationController?.pushViewController(jv, animated: true)
    }
    
    func click() {
        
//        UIView.beginAnimations(nil, context: nil)
//        UIView.setAnimationDuration(3.0)
//        UIView.setAnimationTransition(.curlUp, for: self.view, cache: true)
//        self.view.exchangeSubview(at: 1, withSubviewAt: 0)
//        UIView.commitAnimations()
        
        let mv = MapViewController()
        navigationController?.pushViewController(mv, animated: true)
    }
    
}

extension JLLDiscoveryViewController {
    
    override func setupTableView() {
        
//        self.view.backgroundColor = UIColor.black
        let bgImg = UIImageView(image: #imageLiteral(resourceName: "discover_background"))
        bgImg.frame = CGRect(x: 0, y: 64, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        //右侧按钮
        navItem.rightBarButtonItem = UIBarButtonItem(title: "加入", target: self, action: #selector(showRightButton))
        
        //约球按钮
        let btn = UIButton.init(type: UIButtonType.custom) as UIButton
        let img = UIImage(named: "map")
        btn.setImage(img, for: UIControlState.normal)
        
        let x = self.view.bounds.width / 2 - 50
        let y = self.view.bounds.height - 50
        btn.frame = CGRect(x:x, y:y, width:100, height:100)
        
        btn.addTarget(self, action: #selector(click), for: .touchUpInside)
        
        self.view.addSubview(btn)
        self.view.insertSubview(bgImg, belowSubview: btn)
        showBtn(btn: btn)

    }
    
    func showBtn(btn: UIButton) {
        let anim = POPSpringAnimation(propertyNamed: kPOPLayerPosition)
        let x = self.view.bounds.width / 2
        let y = self.view.bounds.height / 2
        anim?.toValue = NSValue(cgPoint: CGPoint(x: x,y: y))
        anim?.springBounciness = 15
        anim?.springSpeed = 10
        btn.pop_add(anim, forKey: "springPosition")
    }
}
