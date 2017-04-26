//
//  DetailViewController.swift
//  金陵联赛
//
//  Created by 杨耀东 on 17/3/15.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

class DetailViewController: JLLBaseViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var composeTime: UILabel!
    
    @IBOutlet weak var subtitle: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var composeImage: UIImageView!
    
    @IBOutlet weak var likedUsers: UIImageView!
    
    @IBAction func likeBtn(_ sender: Any) {
    }
    
    @IBOutlet weak var commentUser: UIImageView!
    
    @IBOutlet weak var commentName: UILabel!
    
    @IBOutlet weak var commentTime: UILabel!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //设置空间具体内容
        titleLabel.text = "【今日战报】三江1：0电子，三江绝杀取胜"
        userImage.image = UIImage(named: "Messi")
        userName.text = "茜茜公主"
        composeTime.text = "20:52"
        subtitle.text = "【今日战报】三江1：0电子，三江绝杀取胜"
        statusLabel.text = "本轮联赛，电子对抗三江，比赛开始，电子掌控了求全，三江大幅度回收到本方半场防守。电子多次通过边路传中与四十五度斜传球，瘸着破门机会，但并没有良机"
        composeImage.contentMode = UIViewContentMode.scaleAspectFit
        composeImage.image = UIImage(named: "WechatIMG83")
        likedUsers.image = UIImage(named: "Neymar")
        commentUser.image = UIImage(named: "Barca")
        commentName.text = "巴塞罗那"
        commentTime.text = "10分钟前"
        contentLabel.text = "哈哈哈哈哈"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: "View", bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension DetailViewController {
    override func setupTableView() {
//        self.view.backgroundColor = UIColor.black
        
//        //底部工具栏
//        let commentView = UIView()
//        commentView.frame = CGRect(x: 0, y: self.view.frame.height - 50, width: self.view.frame.width, height: 50)
////        commentView.backgroundColor = UIColor.blue
//        self.view.addSubview(commentView)
        
        //文本输入框
//        let text = UITextField()
//        text.frame = CGRect(x: 10, y: 5, width: self.view.frame.width - 80, height: 40)
////        text.borderStyle = UITextBorderStyle.roundedRect
//        text.layer.borderWidth = 0.5
//        text.layer.cornerRadius = 20
//        text.placeholder = "  发表评论"
        
//        //表情按钮
//        let couBtn = UIButton.init(type: UIButtonType.custom) as UIButton
//        let smile = UIImage(named: "bq")
//        couBtn.setImage(smile, for: UIControlState.normal)
//        couBtn.frame = CGRect(x: self.view.frame.width - 55, y: 5, width: 40, height: 40)
        
//        commentView.addSubview(text)
//        commentView.addSubview(couBtn)
    }
}

