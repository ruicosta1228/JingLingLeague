//
//  JLLMatch.swift
//  金陵联赛
//
//  Created by neo on 2017/4/11.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

class JLLMatch: NSObject {
    var team1_name: String?
    
    var team1_icon: String?
    
    var team2_name: String?
    
    var team2_icon: String?
    
    var result: String?
    
    var time: String?
    
    convenience init(team1_name: String, team1_icon: String, team2_name: String, team2_icon: String, result: String?, time: String?){
        self.init()
        
        self.team1_name = team1_name
        self.team1_icon = team1_icon
        self.team2_name = team2_name
        self.team2_icon = team2_icon
        self.result = result
        self.time = time
    }
}
