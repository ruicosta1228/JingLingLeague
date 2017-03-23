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
        
//        let joinBtn = UIBarButtonItem(title: "加入", style: UIBarButtonItemStyle.plain, target: self, action: #selector(JLLDiscoveryViewController.joinAction))
//        self.navigationItem.rightBarButtonItem = joinBtn
//        
//        //        let yue:UIButton = UIButton(type:.system)       //约球按钮
//        //        yue.frame = CGRect(x:180, y:300, width:100, height:30)
//        //        yue.setTitle("约", for: .normal)
//        //
//        //        self.view.addSubview(yue)
//        
//        let btn = UIButton.init(type: UIButtonType.custom) as UIButton
//        let img = UIImage(named: "TabIcon")
//        btn.setImage(img, for: UIControlState.normal)
//        btn.frame = CGRect(x:150, y:300, width:100, height:100)
//        btn.backgroundColor = UIColor.white
//        
//        btn.addTarget(self, action: #selector(JLLDiscoveryViewController.click), for: UIControlEvents.touchUpInside)
//        
//        self.view.addSubview(btn)
    }
    
//    func click() {
//        let map = MapViewController()
//        self.navigationController?.pushViewController(map, animated: true)
//    }
//    
//    func joinAction() {
//        let join = JoinViewController()
//        //        join.modalTransitionStyle = .flipHorizontal
//        //        self.presentingViewController(join, animated: true, completion: nil)
//        self.navigationController?.pushViewController(join, animated: true)
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
