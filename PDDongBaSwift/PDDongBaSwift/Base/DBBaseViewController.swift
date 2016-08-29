//
//  DBBaseViewController.swift
//  PDDongBaSwift
//
//  Created by 彭懂 on 16/8/24.
//  Copyright © 2016年 彭懂. All rights reserved.
//

import Foundation
import UIKit

class DBBaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = kWhiteColor;
        
        let backImageView: UIImageView = UIImageView.init(frame: self.view.bounds)
        backImageView.image = UIImage(named: "backg")
        self.view.addSubview(backImageView)
    }
}

