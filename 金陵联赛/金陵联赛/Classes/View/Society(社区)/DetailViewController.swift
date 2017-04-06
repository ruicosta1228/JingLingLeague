//
//  DetailViewController.swift
//  金陵联赛
//
//  Created by 杨耀东 on 17/3/15.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

class DetailViewController: JLLBaseViewController {

    var image: UIImageView = UIImageView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        setupTableView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}

extension DetailViewController {
    override func setupTableView() {
        super.setupTableView()
        
        image.frame = CGRect(x: 0, y: self.navigationBar.frame.height, width: self.view.frame.width, height: self.view.frame.height / 2)
//        image.image = UIImage(named: "WechatIMG276")

        self.view.addSubview(image)
        
        tableView?.separatorStyle = .none
    }
}
