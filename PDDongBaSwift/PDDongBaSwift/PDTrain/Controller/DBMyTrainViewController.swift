//
//  DBTrainViewController.swift
//  PDDongBaSwift
//
//  Created by 彭懂 on 16/8/24.
//  Copyright © 2016年 彭懂. All rights reserved.
//

import Foundation
import UIKit

class DBMyTrainViewController: DBBaseViewController, UITableViewDelegate, UITableViewDataSource, DBTrainHeaderViewDelegate {
    
    var tableViewHeaderView: DBTrainHeaderView?
    var tableView: UITableView?
    var dataSource: [DBTrainModel] = []
    var headDataSource: [DBTrainModel] = []
    let trainMy: DBTrainMyModel = DBTrainMyModel()
    
    let space: CGFloat = 12.0 / 375.0 * kScreenWith
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DBUserInfo.sharedDNUserInfo.userId = "41"
        self.configNavigationView()
        self.createMainViewUI()
        self.createDataSourceWithNet()
    }
    
    // 设置导航栏
    func configNavigationView() {
        let logoImage: UIImageView = UIImageView.init(frame: CGRectMake(0, 0, 74 / 667.0 * kScreenHeight, 31 / 667.0 * kScreenHeight))
        logoImage.image = UIImage(named: "train_logo")
        self.navigationItem.titleView = logoImage
        
        let rightBtn: UIButton = UIButton.init(type: UIButtonType.Custom)
        rightBtn.setImage(UIImage(named: "add"), forState: UIControlState.Normal)
        rightBtn.frame = CGRectMake(0, 0, 40, 40)
        rightBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0)
        rightBtn.addTarget(self, action: #selector(rightBtnClicked), forControlEvents: UIControlEvents.TouchUpInside)
        let rightBar: UIBarButtonItem = UIBarButtonItem.init(customView: rightBtn)
        self.navigationItem.rightBarButtonItem = rightBar
    }
    
    func rightBtnClicked(sender: UIButton) {
        
    }
    
    // MARK: - 创建数据源
    func createDataSourceWithNet() {
        weak var uSelf = self
        DBTrainNetwork.myTrainPageNetwork(DBUserInfo.sharedDNUserInfo.userId!).successNext({ (respons) in
            print("\(respons)")
            let dic: [String: AnyObject] = respons as! [String: AnyObject]
            if let data: [String: AnyObject] = dic["data"] as? Dictionary {
                if let collection: [AnyObject] = data["collection_lesson_array"] as? Array {
                    for i in 0 ..< collection.count {
                        let subDic: [String: AnyObject] = collection[i] as! [String: AnyObject]
                        let model: DBTrainModel = DBTrainModel.createTrainModel(subDic)
                        uSelf!.dataSource.append(model)
                    }
                }
                if let recommend: [AnyObject] = data["recommend"] as? Array {
                    for i in 0 ..< recommend.count {
                        let subDic: [String: AnyObject] = recommend[i] as! [String: AnyObject]
                        let model: DBTrainModel = DBTrainModel.createTrainModel(subDic)
                        uSelf!.headDataSource.append(model)
                    }
                }
                if let uerInfo: [String: AnyObject] = data["user_info"] as? [String: AnyObject] {
                    uSelf!.trainMy.grade = DBTools.nullString(uerInfo["age_group"])
                    uSelf!.trainMy.lessons = DBTools.nullString(uerInfo["train_num"])
                }
                dispatch_async(dispatch_get_main_queue(), { 
                    uSelf!.tableViewHeaderView?.collectionDataSource = uSelf!.headDataSource
                    uSelf!.tableView?.reloadData()
                })
            } else {
                print("失败  \(dic)")
            }
            }) { (error) in
                print("失败")
        }
    }
}

// MARK: - 创建UI
extension DBMyTrainViewController {
    func createMainViewUI() {
        tableViewHeaderView = DBTrainHeaderView.init(frame: CGRectMake(0, 0, kScreenWith - 2 * space, 270.0 / 667.0 * kScreenHeight))
        tableViewHeaderView!.backgroundColor = UIColor.whiteColor()
        tableViewHeaderView!.layer.cornerRadius = 10
        tableViewHeaderView!.layer.masksToBounds = YES
        tableViewHeaderView!.delegate = self
        
        tableView = UITableView.init(frame: CGRectMake(space, 64 - 35.0 / 667.0 * kScreenHeight, kScreenWith - 2 * space, kScreenHeight - (64 - 35.0 / 667.0 * kScreenHeight) - 49), style: UITableViewStyle.Plain)
        tableView?.backgroundColor = UIColor.clearColor()
        tableView?.backgroundView = UIView()
        tableView?.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView?.showsVerticalScrollIndicator = NO
        tableView?.showsHorizontalScrollIndicator = NO
        tableView?.delegate = self
        tableView?.dataSource = self
//        tableView?.backgroundView!.layer.cornerRadius = 10
//        tableView?.backgroundView!.layer.masksToBounds = YES
        tableView?.tableHeaderView = tableViewHeaderView
        self.view.addSubview(tableView!)
    }
}

// MARK: - 各种代理方法的实现
extension DBMyTrainViewController {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell: DBMyTrainCell = DBMyTrainCell.createTableViewCellClassWithTableView(tableView)
            cell.uLable?.text = trainMy.grade
            cell.ksLable?.text = trainMy.lessons
            return cell
        } else {
            let cell: DBMyCollectionCell = DBMyCollectionCell.createMyCollectionCellWithTableView(tableView)
            let trainModel: DBTrainModel = dataSource[indexPath.row]
            cell .fetchUIWithModel(trainModel)
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 57.0 / 667.0 * kScreenHeight
        }
        return 168.0 / 667.0 * kScreenHeight
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 43 / 667.0 * kScreenHeight
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let backView: UIView = UIView.init(frame: CGRectMake(0, 0, tableView.with, 43 / 667.0 * kScreenHeight))
        backView.backgroundColor = UIColor.clearColor()
        
        let whiteView: UIView = UIView.init(frame: CGRectMake(0, 10 / 667.0 * kScreenHeight, backView.with, backView.height - 10 / 667.0 * kScreenHeight))
        let rectCorner: UIRectCorner = [UIRectCorner.TopRight, UIRectCorner.TopLeft]
        let path: UIBezierPath = UIBezierPath.init(roundedRect: whiteView.bounds, byRoundingCorners: rectCorner, cornerRadii: CGSizeMake(10, 10))
        let shapeLayer: CAShapeLayer = CAShapeLayer()
        shapeLayer.fillColor = UIColor.whiteColor().CGColor
        shapeLayer.strokeColor = UIColor.clearColor().CGColor
        shapeLayer.path = path.CGPath
        whiteView.layer.addSublayer(shapeLayer)
        
        let view: UIView = UIView.init(frame: CGRectMake(10, 8, 5, 15))
        view.backgroundColor = colorWithRGB(40.0, G: 182.0, B: 252.0)
        whiteView.addSubview(view)
        
        let tranL: UILabel = UILabel.init(frame: CGRectMake(view.right + 5, view.top, 200, view.height))
        tranL.font = UIFont.systemFontOfSize(14)
        if section == 0 {
            tranL.text = "我的训练"
        } else {
            tranL.text = "我的收藏"
        }
        whiteView.addSubview(tranL)
        backView.addSubview(whiteView)
        return backView
    }
    
    // 头视图代理方法
    func collectionViewCleckedCellNumber(number: NSInteger) {
        
    }
    
    func collectionPlayNumber(number: NSInteger) {
        
    }
}

