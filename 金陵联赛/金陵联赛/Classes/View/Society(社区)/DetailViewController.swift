//
//  DetailViewController.swift
//  金陵联赛
//
//  Created by 杨耀东 on 17/3/15.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit

private let cellId = "cellId"

class DetailViewController: JLLBaseViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var composeTime: UILabel!
    
    @IBOutlet weak var subtitle: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var composeImage: UIImageView!
    
    @IBOutlet weak var likedUsers: UIImageView!
    
    @IBOutlet weak var likedBtn: UIButton!

    
    @IBOutlet weak var contentField: UIView!
    
    @IBOutlet weak var image2: UIImageView!

//    @IBOutlet weak var commentUser: UIImageView!
//    
//    @IBOutlet weak var commentName: UILabel!
//    
//    @IBOutlet weak var commentTime: UILabel!
//    
//    @IBOutlet weak var contentLabel: UILabel!
    
    let contentList:[String] = ["1", "2"]
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        likedBtn.addTarget(self, action: #selector(click), for: .touchUpInside)
        
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

    override func loadData() {
        print("加载数据")
    }
    
}

extension DetailViewController {
    override func setupTableView() {
        super.setupTableView()
        
        tableView?.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: contentField.bounds.height, right: 0)
        
        //注册原型cell
        tableView?.register(UINib(nibName: "cell", bundle: nil), forCellReuseIdentifier: cellId)
        
        //设置行高
        tableView?.rowHeight = 100
        
        //取消分割线
        tableView?.separatorStyle = .none
        
        contentField.addSubview(tableView!)
        
    }
    
    func click() {
        likedBtn.isSelected = !likedBtn.isSelected
        image2.image = UIImage(named: "Bayer")
    }
}

extension DetailViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! commentCell
        
        if indexPath.row == 0 {
            cell.commentUser.image = UIImage(named: "Barca")
            cell.commentName.text = "巴塞罗那"
            cell.commentTime.text = "10分钟前"
            cell.contentLabel.text = "哈哈哈哈哈"
        }
        
        if indexPath.row == 1 {
            cell.commentUser.image = UIImage(named: "Real Madrid CF")
            cell.commentName.text = "皇马"
            cell.commentTime.text = "15分钟前"
            cell.contentLabel.text = "很强"
        }
        
        return cell
    }

}
