//
//  DetailViewController.swift
//  金陵联赛
//
//  Created by 杨耀东 on 17/3/15.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

class DetailViewController: JLLBaseViewController {

//    var image: UIImageView = UIImageView()
    
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
        
        let v = DetailView()
        self.view.addSubview(v)
    }
}
