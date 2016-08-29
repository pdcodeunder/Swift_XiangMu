
//
//  DBBackBaseViewController.swift
//  PDDongBaSwift
//
//  Created by 彭懂 on 16/8/24.
//  Copyright © 2016年 彭懂. All rights reserved.
//

import Foundation
import UIKit

class DBBackBaseViewController: DBBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpLeftBackBtn()
    }
    
    // 设置返回按钮
    func setUpLeftBackBtn() {
        let backBtn: UIButton = UIButton.init(type: UIButtonType.Custom)
        backBtn.setImage(UIImage.init(named: "newback"), forState: UIControlState.Normal)
        backBtn.frame = CGRectMake(0, 0, 40, 40)
        backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20)
        backBtn.addTarget(self, action: #selector(backBtnClicked), forControlEvents: UIControlEvents.TouchUpInside)
        let btnItem: UIBarButtonItem = UIBarButtonItem.init(customView: backBtn)
        self.navigationItem.leftBarButtonItem = btnItem
    }
    
    func backBtnClicked(sender: UIButton) {
        
    }
}
