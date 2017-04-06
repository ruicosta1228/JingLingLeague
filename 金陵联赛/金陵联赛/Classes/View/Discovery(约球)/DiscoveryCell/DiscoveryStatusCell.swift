//
//  DiscoveryStatusCell.swift
//  金陵联赛
//
//  Created by Salasoul on 2017/3/29.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

class DiscoveryStatusCell: UITableViewCell {

    //发起约球的用户的头像
    @IBOutlet weak var userImage: UIImageView!
    
    // 加入比赛 按钮
    @IBAction func joinBtn(_ sender: Any) {
        print("现在加入")
        let alert = UIAlertController(title: "系统提示",
                                      message: "联系发起人",
                                      preferredStyle: .alert)
        let cancel = UIAlertAction(title: "取消",
                                   style: .cancel,
                                   handler: nil)
        let call = UIAlertAction(title: "呼叫",
                                 style: .default,
                                 handler: {action in print("呼叫")})
        alert.addAction(cancel)
        alert.addAction(call)
        
        //弹出alert
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    //比赛地点
    @IBOutlet weak var locationLabel: UILabel!

    //比赛发起时间
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        userImage.image = UIImage(named: "Neymar")
        
        locationLabel.text = "南大金陵足球场"
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyy-MM-dd 'at' HH:mm"
        let strNowTime = formatter.string(from: date as Date) as String
        let timeArray = strNowTime.components(separatedBy: "at")
        timeLabel.text = timeArray[1]

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
