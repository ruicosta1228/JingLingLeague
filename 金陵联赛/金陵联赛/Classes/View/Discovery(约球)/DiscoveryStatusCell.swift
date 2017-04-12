//
//  DiscoveryStatusCell.swift
//  金陵联赛
//
//  Created by Salasoul on 2017/4/12.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

class DiscoveryStatusCell: UITableViewCell {

    @IBOutlet weak var backgroundImg: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subtitleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundImg.image = UIImage(named: "page1")
        titleLabel.text = "哥们，周末球场来约吗！"
        subtitleLabel.text = "4.16 周日  南京大学浦口校区体育场"
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
