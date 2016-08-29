
//
//  DBBaseNavigationController.swift
//  PDDongBaSwift
//
//  Created by 彭懂 on 16/8/24.
//  Copyright © 2016年 彭懂. All rights reserved.
//

import Foundation
import UIKit

class DBBaseNavigationController: UINavigationController {
    
    let backView : UIView = UIView.init(frame: CGRectMake(0, 0, kScreenWith, 64))
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backView.backgroundColor = UIColor.whiteColor()
        backView.hidden = self.navigationBar.hidden
        self.view.insertSubview(backView, atIndex: 0)
        
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.colorWithHex("#345678"), NSFontAttributeName: k17NormalFont]
    }

}