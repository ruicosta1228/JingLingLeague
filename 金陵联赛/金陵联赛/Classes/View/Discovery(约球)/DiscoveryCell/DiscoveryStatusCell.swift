//
//  DiscoveryStatusCell.swift
//  金陵联赛
//
//  Created by Salasoul on 2017/3/29.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

class DiscoveryStatusCell: UITableViewCell {

    //发起约球的用户的头像
    @IBOutlet weak var userImage: UIImageView!
    
    // 加入比赛 按钮
    @IBOutlet weak var joinBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        userImage.image = UIImage(named: "TabIcon")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
