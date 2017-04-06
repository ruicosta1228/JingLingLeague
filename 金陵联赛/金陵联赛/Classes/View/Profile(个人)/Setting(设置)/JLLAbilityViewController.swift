//
//  JLLAbilityViewController.swift
//  金陵联赛
//
//  Created by Marco on 2017/4/7.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit
import PPNumberButtonSwift

class JLLAbilityViewController: JLLBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        speed()
        strong()
        skill()
        strength()
        shoot()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func speed() {
        
        let numberButton = PPNumberButton.init(frame: CGRect(x: 270, y: 20, width: 100, height: 20))
        
        //设置边框颜色
        numberButton.borderColor(UIColor.gray)
        
        //开启抖动动画
        numberButton.shakeAnimation = true
        numberButton.maxValue = 100
        numberButton.minValue = 1
        
        //加减按钮的闭包回调
        numberButton.numberResult { (number) in
            
            
            
            print(number)
        }
        
        self.view.addSubview(numberButton)
    }

    func strong() {
        
        let numberButton = PPNumberButton.init(frame: CGRect(x: 270, y: 80, width: 100, height: 20))
        
        //设置边框颜色
        numberButton.borderColor(UIColor.gray)
        
        //开启抖动动画
        numberButton.shakeAnimation = true
        numberButton.maxValue = 100
        numberButton.minValue = 1
        
        //加减按钮的闭包回调
        numberButton.numberResult { (number) in
            
            
            
            print(number)
        }
        
        self.view.addSubview(numberButton)
    }
    
    func skill() {
        
        let numberButton = PPNumberButton.init(frame: CGRect(x: 270, y: 140, width: 100, height: 20))
        
        //设置边框颜色
        numberButton.borderColor(UIColor.gray)
        
        //开启抖动动画
        numberButton.shakeAnimation = true
        numberButton.maxValue = 100
        numberButton.minValue = 1
        
        //加减按钮的闭包回调
        numberButton.numberResult { (number) in
            
            
            
            print(number)
        }
        
        self.view.addSubview(numberButton)
    }
    
    func strength() {
        
        let numberButton = PPNumberButton.init(frame: CGRect(x: 270, y: 200, width: 100, height: 20))
        
        //设置边框颜色
        numberButton.borderColor(UIColor.gray)
        
        //开启抖动动画
        numberButton.shakeAnimation = true
        numberButton.maxValue = 100
        numberButton.minValue = 1
        
        //加减按钮的闭包回调
        numberButton.numberResult { (number) in
            
            
            
            print(number)
        }
        
        self.view.addSubview(numberButton)
    }
    
    func shoot() {
        
        let numberButton = PPNumberButton.init(frame: CGRect(x: 310, y: 260, width: 100, height: 20))
        
        //设置边框颜色
        numberButton.borderColor(UIColor.gray)
        
        //开启抖动动画
        numberButton.shakeAnimation = true
        numberButton.maxValue = 100
        numberButton.minValue = 1
        
        //加减按钮的闭包回调
        numberButton.numberResult { (number) in
            
            
            
            print(number)
        }
        
        self.view.addSubview(numberButton)
    }




    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension JLLAbilityViewController{
    
    override func setupTableView() {
        self.view.backgroundColor = UIColor.white
        navigationBar.isHidden = true
        
        
        
    }
}

