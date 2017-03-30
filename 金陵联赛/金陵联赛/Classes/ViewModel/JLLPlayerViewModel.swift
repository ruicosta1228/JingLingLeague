//
//  JLLPlayerViewMoel.swift
//  金陵联赛
//
//  Created by neo on 2017/3/30.
//  Copyright © 2017年 neo. All rights reserved.
//

import Foundation

class JLLPlayerViewModel {
    lazy var player: JLLPlayer = JLLPlayer()
    
    func login(completion:@escaping (_ isSuccess: Bool)->()){
        JLLNetworkingManager.shared.playerLoginList(completion: { (list, isSuccess) in
            self.player = JLLPlayer.dcObjectWithKeyValues(list) as! JLLPlayer
            
            completion(isSuccess)
        })
    }
}
