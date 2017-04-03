//
//  JLLNewFeatureView.swift
//  金陵联赛
//
//  Created by Salasoul on 2017/4/3.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit
import LTMorphingLabel

class JLLNewFeatureView: UIView, LTMorphingLabelDelegate {

    var i = -1
    var textArray = ["好不容易找到小伙伴",
                                 "却发现四处高楼林立?",
                                 "或许你想来场酣畅淋漓的友谊赛",
                                 "却发现无人响应?",
                                 "或许你对某场比赛有独到的见解",
                                 "却发现无人聆听?",
                                 "使用金陵联赛",
                                 "加入我们吧!"]
    
    @IBOutlet var label: LTMorphingLabel!
    
    var text: String {
        i = i >= textArray.count - 1 ? 0 : i + 1
        return textArray[i]
    }
    
    @IBAction func changeText(_ sender: Any) {
        label.text = text
        self.label.morphingEffect = .evaporate
    }
    
    func newFeature() -> JLLNewFeatureView {
        
        let nib = UINib(nibName: "JLLNewFeatureView", bundle: nil)
        let v = nib.instantiate(withOwner: nil, options: nil)[0] as! JLLNewFeatureView
        return v
        
    }
}
