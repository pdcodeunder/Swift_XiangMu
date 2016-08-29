//
//  DBMyCollectionCell.swift
//  PDDongBaSwift
//
//  Created by 彭懂 on 16/8/25.
//  Copyright © 2016年 彭懂. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class DBMyCollectionCell: UITableViewCell {
    class func createMyCollectionCellWithTableView(tableView: UITableView) ->DBMyCollectionCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("DBMyCollectionCell")
        if cell == nil {
            cell = DBMyCollectionCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: "DBMyCollectionCell")
        }
        return cell as! DBMyCollectionCell
    }
    
    var backImageView: UIImageView?
    var titleL: UILabel?
    var timeLable: PDImageAndLableView?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCellSelectionStyle.None
        self.createCollectionCellUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createCollectionCellUI() {
        backImageView = UIImageView.init(frame: CGRectMake(0, 0, kScreenWith - 24 / 375.0 * kScreenWith, 140 / 667.0 * kScreenHeight))
        self.contentView.addSubview(backImageView!)
        
        titleL = UILabel.init(frame: CGRectMake(10, backImageView!.bottom, 280 / 375.0 * kScreenWith, 30 / 667.0 * kScreenHeight))
        titleL?.font = UIFont.systemFontOfSize(14)
        titleL?.textColor = UIColor.colorWithHex("#333333")
        self.contentView.addSubview(titleL!)
        
        timeLable = PDImageAndLableView.init(frame: CGRectMake(0, 0, 100, 13))
        timeLable?.center = CGPointMake(318 / 375.0 * kScreenWith, titleL!.center.y)
        self.contentView.addSubview(timeLable!)
    }
    
    func fetchUIWithModel(model: DBTrainModel) {
        backImageView?.kf_setImageWithURL(NSURL.init(string: model.tainImageURL!))
        titleL?.text = model.trainTitle
        timeLable?.imageView?.image = UIImage(named: "time")
        timeLable?.titleLable?.text = model.trainTime
    }
}
