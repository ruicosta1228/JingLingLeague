//
//  JLLDiscoveryViewController.swift
//  金陵联赛
//
//  Created by neo on 2017/3/5.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

class JLLDiscoveryViewController: JLLBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showRightButton() {
        let mv = MapViewController()
        navigationController?.pushViewController(mv, animated: true)
    }
    
    func click() {
        
        let jv = JoinViewController()
        navigationController?.pushViewController(jv, animated: true)
    }
    
}

extension JLLDiscoveryViewController {
    
    override func setupTableView() {
        
//        self.view.backgroundColor = UIColor.black
        let bgImg = UIImageView(image: #imageLiteral(resourceName: "discover_background"))
        bgImg.frame = CGRect(x: 0, y: 64, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        //右侧按钮
        navItem.rightBarButtonItem = UIBarButtonItem(title: "发起", target: self, action: #selector(showRightButton))
        
        //发起按钮
        let btn = UIButton.init(type: UIButtonType.custom) as UIButton
        let img = UIImage(named: "map")
        btn.setImage(img, for: UIControlState.normal)
        
        let x = self.view.bounds.width / 2 - 50
        let y = self.view.bounds.height / 2 - 50
        btn.frame = CGRect(x:x, y:y, width:100, height:100)
        
        btn.addTarget(self, action: #selector(click), for: .touchUpInside)
        
        self.view.addSubview(btn)
        self.view.insertSubview(bgImg, belowSubview: btn)

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        setupUI()
    }
}
