//
//  JLLScheduleCell.swift
//  金陵联赛
//
//  Created by Marco on 2017/3/29.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

class JLLScheduleCell: UITableViewCell {

    
    @IBOutlet weak var VS: UILabel!
    @IBOutlet weak var Time: UILabel!
    @IBOutlet weak var Team2Name: UILabel!
    @IBOutlet weak var Team1Name: UILabel!
    @IBOutlet weak var Team2Logo: UIImageView!
    @IBOutlet weak var Team1Logo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
