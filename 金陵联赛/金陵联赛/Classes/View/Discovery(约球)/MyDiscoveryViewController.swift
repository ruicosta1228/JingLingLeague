//
//  MyDiscoveryViewController.swift
//  金陵联赛
//
//  Created by Salasoul on 2017/5/20.
//  Copyright © 2017年 neo. All rights reserved.
//

import UIKit
import PageMenu

class MyDiscoveryViewController: JLLBaseViewController {
    
    var pageMenu : CAPSPageMenu?
    
    func setPage() {
        var controllerArray : [JLLBaseViewController] = []
        
        let ctrl1 : JoinedViewController = JoinedViewController()
//        let ctrl1 : DiscoveryDetailViewController = DiscoveryDetailViewController()
        ctrl1.title = "我加入的约球"
        controllerArray.append(ctrl1)
        
        let ctrl2 : ComposedViewController = ComposedViewController()
        ctrl2.title = "我发起的约球"
        controllerArray.append(ctrl2)
        
        let menuParam: [CAPSPageMenuOption] = [
            .menuItemSeparatorWidth(1.0),
            .menuMargin(20.0),
            .menuHeight(40.0),
            .useMenuLikeSegmentedControl(true),
            .menuItemSeparatorRoundEdges(true),
            .selectionIndicatorHeight(2.0),
            .menuItemSeparatorPercentageHeight(0.5)
        ]
        
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0.0, y: 64.0, width: self.view.frame.width, height: 600), pageMenuOptions: menuParam)
        
        self.view.addSubview(pageMenu!.view)
    }
    
}

extension MyDiscoveryViewController {
    
    override func setupTableView() {
        title = "我的约球"
        setPage()
        
        navItem.rightBarButtonItem = UIBarButtonItem(title: "历史约球", target: self, action: #selector(showRightBtn))
    }
    
    func showRightBtn() {
        let vc = HistoryViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
