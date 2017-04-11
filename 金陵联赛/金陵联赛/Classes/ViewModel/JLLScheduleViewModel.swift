//
//  JLLScheduleViewModel.swift
//  金陵联赛
//
//  Created by neo on 2017/4/11.
//  Copyright © 2017年 neo. All rights reserved.
//

import Foundation

class JLLScheduleViewModel {
    lazy var matches = [JLLMatch]()
    
    func matches_init(){
        matches.append(JLLMatch(team1_name: "拜仁慕尼黑", team1_icon: "Bayer", team2_name: "多特蒙德", team2_icon: "Dortmond", result: "0   :   2",
                                time: "4.10  21:00"))
        matches.append(JLLMatch(team1_name: "皇家马德里", team1_icon: "Real Madrid CF", team2_name: "巴塞罗那", team2_icon: "Barca", result: "1   :   1",
                                time: "4.11  21:00"))
        matches.append(JLLMatch(team1_name: "瓦伦西亚", team1_icon: "Valencia", team2_name: "奥赛苏娜", team2_icon: "Osasuna", result: "3   :   2",
                                time: "4.12  21:00"))
        matches.append(JLLMatch(team1_name: "切尔西", team1_icon: "Chelsea", team2_name: "AC米兰", team2_icon: "ACM", result: "4   :   2",
                                time: "4.13  22:00"))
        matches.append(JLLMatch(team1_name: "巴塞罗那", team1_icon: "Barca", team2_name: "瓦伦西亚", team2_icon: "Valencia", result: "2   :   2",
                                time: "4.14  23:00"))
    }
}
