//
//  JLLAbility.swift
//  金陵联赛
//
//  Created by neo on 2017/6/11.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

class JLLAbility: NSObject {
    var pId: String?
    
    var speed: String?
    
    var shoot: String?
    
    var body: String?
    
    var defence: String?
    
    var aware: String?
    
    var patience: String?
    
    var accelerate: String?
    
    var intercept: String?
    
    var balance: String?
    
    var skill: String?
    
    var bounce: String?
    
    var active: String?
    
    convenience init(pId: String, speed: String,shoot: String,body: String, defence: String,aware: String,patience: String,accelerate: String,intercept: String, balance: String, skill: String,bounce: String, active: String) {
        
        self.init()

        self.pId = pId
        self.speed = speed
        self.shoot = shoot
        self.body = body
        self.defence = defence
        self.aware = aware
        self.patience = patience
        self.accelerate = accelerate
        self.intercept = intercept
        self.balance = balance
        self.skill = skill
        self.bounce = bounce
        self.active = active
    }
}
