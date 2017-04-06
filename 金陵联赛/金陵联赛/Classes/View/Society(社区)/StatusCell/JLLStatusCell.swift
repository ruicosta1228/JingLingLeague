 //
//  JLLStatusCell.swift
//  金陵联赛
//
//  Created by Salasoul on 2017/3/27.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

class JLLStatusCell: UITableViewCell {

    //头像
    @IBOutlet weak var iconView: UIImageView!
    //姓名
    @IBOutlet weak var nameLabel: UILabel!
    //时间
    @IBOutlet weak var timeLabel: UILabel!
    //来源
    @IBOutlet weak var sourceLabel: UILabel!
    //正文
    @IBOutlet weak var statusLabel: UILabel!
    //底部工具栏
    @IBOutlet var toolBar: JLLStatusToolBar!
    //配图视图
    @IBOutlet var picView: JLLStatusPictureView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
