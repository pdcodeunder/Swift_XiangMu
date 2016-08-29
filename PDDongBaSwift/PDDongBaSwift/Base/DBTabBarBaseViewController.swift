//
//  DBTabBarBaseViewController.swift
//  PDDongBaSwift
//
//  Created by 彭懂 on 16/8/24.
//  Copyright © 2016年 彭懂. All rights reserved.
//

import Foundation
import UIKit

class DBTabBarBaseViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pd_setUpUi()
    }
    
    func pd_setUpUi() {
        let trainVC: DBMyTrainViewController = DBMyTrainViewController()
        let trainNC: DBBaseNavigationController = DBBaseNavigationController.init(rootViewController: trainVC)
        let trainItem: UITabBarItem = UITabBarItem.init(title: "训练", image: UIImage.init(named: "trainning")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage.init(named: "trainning")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        trainNC.tabBarItem = trainItem
        
        let evaluationVC: DBEvaluationViewController = DBEvaluationViewController()
        let evaluationNC: DBBaseNavigationController = DBBaseNavigationController.init(rootViewController: evaluationVC)
        let evaluationItem: UITabBarItem = UITabBarItem.init(title: "评测", image: UIImage(named: "test")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: "test")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        evaluationNC.tabBarItem = evaluationItem;
        
        let mySelfVC: DBMyPageViewController = DBMyPageViewController()
        let mySelfNC: DBBaseNavigationController = DBBaseNavigationController.init(rootViewController: mySelfVC)
        let mySelfItem: UITabBarItem = UITabBarItem.init(title: "我", image: UIImage(named: "me")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: "me")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        mySelfNC.tabBarItem = mySelfItem
        
        self.viewControllers = [trainNC, evaluationNC, mySelfNC]
    }
}
