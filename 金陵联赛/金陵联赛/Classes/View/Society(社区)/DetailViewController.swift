//
//  DetailViewController.swift
//  金陵联赛
//
//  Created by 杨耀东 on 17/3/15.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

class DetailViewController: JLLBaseViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var composeTime: UILabel!
    
    @IBOutlet weak var subtitle: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var composeImage: UIImageView!
    
    @IBOutlet weak var likedUsers: UIImageView!
    
    @IBAction func likeBtn(_ sender: Any) {
    }
    
    @IBOutlet weak var commentUser: UIImageView!
    
    @IBOutlet weak var commentName: UILabel!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupTableView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func awakeFromNib() {
        composeImage.image = UIImage(named: "Neymar_full")
    }

}

extension DetailViewController {
    override func setupTableView() {
//        self.view.backgroundColor = UIColor.white
        
        
    }
}
