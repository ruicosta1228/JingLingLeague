//
//  JLLStatusCell.swift
//  金陵联赛
//
//  Created by Salasoul on 2017/4/7.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

class JLLStatusCell: UITableViewCell {
    
    //头像
    @IBOutlet weak var userImage: UIImageView!
    //用户名
    @IBOutlet weak var nameLabel: UILabel!
    //时间
    @IBOutlet weak var timeLabel: UILabel!
    //标题
    @IBOutlet weak var titleLabel: UILabel!
    //图片
    @IBOutlet weak var composeImage: UIImageView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        composeImage.image = UIImage(named: "Neymar_full")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
