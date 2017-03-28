//
//  JLLProfileCell.swift
//  金陵联赛
//
//  Created by Marco on 2017/3/27.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

class JLLProfileCell: UITableViewCell {
    
//    雷达图
    @IBOutlet weak var RaderImage: UIImageView!

//    头像
    @IBOutlet weak var PhotoImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
