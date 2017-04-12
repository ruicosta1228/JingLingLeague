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
        society.append(JLLSociety(composeImage: "WechatIMG83", userImage: "Messi", nameLabel: "茜茜公主", timeLabel: "00:00", titleLabel: "【今日战报】三江1：0电子，三江绝杀取胜", statusLabel: "本轮联赛，电子对抗三江，比赛开始，电子掌控了求全，三江大幅度回收到本方半场防守。电子多次通过边路传中与四十五度斜传球，瘸着破门机会，但并没有良机"))
        society.append(JLLSociety(composeImage: "WechatIMG89", userImage: "Reus", nameLabel: "罗伊斯斯", timeLabel: "00:00", titleLabel: "【今日战报】商院2：0艺术，航帅梅开二度带走三分", statusLabel: "比赛开始，艺术学院9号陈旭开球便射门，可惜皮球偏出。商院压上进攻，艺术学院防守队员禁区线附近手球，11号雷文杰主罚打在了人墙上。"))
        society.append(JLLSociety(composeImage: "WechatIMG274", userImage: "Cristiano Ronaldo", nameLabel: "西罗", timeLabel: "00:00", titleLabel: "【赛事预告】商南大金陵校队将于3月17日下午三点30分对抗南信工", statusLabel: "解释各个院队的精英们将在球场上奋力拼搏，此次热身赛也是为了将要到来的省运会预选赛做准备，希望大家届时为我校队加油！"))
    }
}
