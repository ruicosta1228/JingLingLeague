//
//  commentCell.swift
//  金陵联赛
//
//  Created by Salasoul on 2017/4/27.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

class commentCell: UITableViewCell {
    
    @IBOutlet weak var commentUser: UIImageView!
    
    @IBOutlet weak var commentName: UILabel!
    
    @IBOutlet weak var commentTime: UILabel!
    
    @IBOutlet weak var contentLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
