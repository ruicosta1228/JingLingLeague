//
//  JLLNewFeatureView.swift
//  金陵联赛
//
//  Created by Salasoul on 2017/3/30.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit
import LTMorphingLabel

class JLLNewFeatureView: UIView {

    let text: String = "哈哈哈哈"
    
    @IBOutlet var textLabel: LTMorphingLabel!
    
    @IBAction func changeText(sender: AnyObject) {
        textLabel.text = text
    }
    
    @IBAction func segmentChanged(sender: AnyObject) {
        self.textLabel.morphingEffect = .anvil
    }
    
    class func newFeatureView() -> JLLNewFeatureView {
        
        let nib = UINib(nibName: "JLLNewFeatureView", bundle: nil)
        
        let v = nib.instantiate(withOwner: nil, options: nil)[0] as! JLLNewFeatureView
        
        return v
    }

}
