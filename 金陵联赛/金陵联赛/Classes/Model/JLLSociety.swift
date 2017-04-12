//
//  JLLSociety.swift
//  金陵联赛
//
//  Created by neo on 2017/4/12.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

class JLLSociety: NSObject {
    var composeImage: String?
    
    var userImage: String?
    
    var nameLabel: String?
    
    var timeLabel: String?
    
    var titleLabel: String?
    
    var statusLabel: String?
    
    convenience init(composeImage: String, userImage: String, nameLabel: String, timeLabel: String, titleLabel: String, statusLabel: String?){
        self.init()
        
        self.composeImage = composeImage
        
        self.userImage = userImage
        
        self.nameLabel = nameLabel
        
        self.timeLabel = timeLabel
        
        self.titleLabel = titleLabel
        
        self.statusLabel = statusLabel
    }
}
