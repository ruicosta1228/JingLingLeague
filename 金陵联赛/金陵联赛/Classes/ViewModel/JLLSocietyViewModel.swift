//
//  JLLSocietyViewModel.swift
//  金陵联赛
//
//  Created by neo on 2017/4/12.
//  Copyright © 2017年 neo. All rights reserved.
//

import Foundation

class JLLSocietyViewModel{
    lazy var society = [JLLSociety]()
    
    func society_init(){
        society.append(JLLSociety(sId: "6",composeImage: "http://localhost:8080/JingLingLeague/images/society/WechatIMG83.jpeg", userImage: "http://localhost:8080/JingLingLeague/images/users/Messi.jpg", nameLabel: "茜茜公主", timeLabel: "00:00", titleLabel: "【今日战报】三江1：0电子，三江绝杀取胜", statusLabel: "本轮联赛，电子对抗三江，比赛开始，电子掌控了求全，三江大幅度回收到本方半场防守。电子多次通过边路传中与四十五度斜传球，瘸着破门机会，但并没有良机"))
        society.append(JLLSociety(sId: "5",composeImage: "http://localhost:8080/JingLingLeague/images/society/WechatIMG89.jpeg", userImage: "http://localhost:8080/JingLingLeague/images/users/Reus.jpg", nameLabel: "罗伊斯斯", timeLabel: "00:00", titleLabel: "【今日战报】商院2：0艺术，航帅梅开二度带走三分", statusLabel: "比赛开始，艺术学院9号陈旭开球便射门，可惜皮球偏出。商院压上进攻，艺术学院防守队员禁区线附近手球，11号雷文杰主罚打在了人墙上。"))
        society.append(JLLSociety(sId: "4",composeImage: "http://localhost:8080/JingLingLeague/images/society/WechatIMG274.jpeg", userImage: "http://localhost:8080/JingLingLeague/images/users/Reus.jpg", nameLabel: "西罗", timeLabel: "00:00", titleLabel: "【赛事预告】商南大金陵校队将于3月17日下午三点30分对抗南信工", statusLabel: "解释各个院队的精英们将在球场上奋力拼搏，此次热身赛也是为了将要到来的省运会预选赛做准备，希望大家届时为我校队加油！"))
        society.append(JLLSociety(sId: "3",composeImage: "http://localhost:8080/JingLingLeague/images/society/WechatIMG275.jpeg", userImage: "http://localhost:8080/JingLingLeague/images/users/Reus.jpg", nameLabel: "axiba", timeLabel: "00:00", titleLabel: "今天分享的是朱教练的跑位训练方法", statusLabel: "球员们都平行站位，防守球员最后一名中后卫拖后，而进攻的球员距离防线3米左右，在看到长传球后加速冲刺，穿过整条防线"))
        society.append(JLLSociety(sId: "2",composeImage: "http://localhost:8080/JingLingLeague/images/society/WechatIMG276.jpeg", userImage: "http://localhost:8080/JingLingLeague/images/users/Reus.jpg", nameLabel: "西罗", timeLabel: "00:00", titleLabel: "【赛事预告】商南大金陵校队将于3月17日下午三点30分对抗南信工", statusLabel: "解释各个院队的精英们将在球场上奋力拼搏，此次热身赛也是为了将要到来的省运会预选赛做准备，希望大家届时为我校队加油！"))
//        society.append(JLLSociety(sId: "1",composeImage: "http://localhost:8080/JingLingLeague/images/society/WechatIMG277.jpeg", userImage: "http://localhost:8080/JingLingLeague/images/users/Reus.jpg", nameLabel: "西罗", timeLabel: "00:00", titleLabel: "【赛事预告】商南大金陵校队将于3月17日下午三点30分对抗南信工", statusLabel: "解释各个院队的精英们将在球场上奋力拼搏，此次热身赛也是为了将要到来的省运会预选赛做准备，希望大家届时为我校队加油！"))
    }
    
//    func pullup(oldId: String){
//        JLLNetworkingManager.shared.pullup_getnews(sId: oldId, count: "-1", completion: {(json) in
////            print(json)
//            let dict = (json as NSDictionary)
////            let societyList: JLLSocietyList = JLLSocietyList.dcObjectWithKeyValues(dict) as! JLLSocietyList
////            print(dict)
//            let array = dict.object(forKey: "societyList")
//            print(array ?? [])
//            let list = NSArray.yy_modelArray(with: JLLSociety.self, json: array!) as! [JLLSociety]
//            for news in list.reversed(){
//                self.society.append(news)
//            }
////            print("现在list的数量")
////            print(self.society.count)
//        })
//    }
//    
//    func fresh(newId: String){
//        
//    }
}
