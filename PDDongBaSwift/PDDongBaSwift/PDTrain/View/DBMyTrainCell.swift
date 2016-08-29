//
//  DBMyTrainCell.swift
//  PDDongBaSwift
//
//  Created by 彭懂 on 16/8/25.
//  Copyright © 2016年 彭懂. All rights reserved.
//

import Foundation
import UIKit

class DBMyTrainCell: UITableViewCell {
    class func createTableViewCellClassWithTableView(tableView: UITableView) -> DBMyTrainCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("DBMyTrainCell")
        if cell == nil {
            cell = DBMyTrainCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: "DBMyTrainCell")
        }
        return cell as! DBMyTrainCell
    }
    
    var uLable: UILabel?
    var ksLable: UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCellSelectionStyle.None
        self.createTrainCellUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createTrainCellUI() {
        self.backgroundColor = UIColor.clearColor()
        self.contentView.backgroundColor = UIColor.clearColor()
        let rectCorner: UIRectCorner = [UIRectCorner.BottomRight, UIRectCorner.BottomLeft]
        let path: UIBezierPath = UIBezierPath.init(roundedRect: CGRectMake(0, 0, kScreenWith - 24.0 / 375.0 * kScreenWith, 57.0 / 667.0 * kScreenHeight), byRoundingCorners: rectCorner, cornerRadii: CGSizeMake(10, 10))
        let shapeLayer: CAShapeLayer = CAShapeLayer()
        shapeLayer.fillColor = UIColor.whiteColor().CGColor
        shapeLayer.strokeColor = UIColor.clearColor().CGColor
        shapeLayer.path = path.CGPath
        self.contentView.layer.addSublayer(shapeLayer)
        
        let uImage: UIImageView = UIImageView.init(frame: CGRectMake(26, 0, 42.5, 42.0))
        uImage.image = UIImage(named: "level")
        self.contentView.addSubview(uImage)
        
        let djl: UILabel = UILabel.init(frame: CGRectMake(uImage.right + 15, uImage.top, 100, 14))
        djl.font = UIFont.systemFontOfSize(12)
        djl.textColor = UIColor.colorWithHex("#cccccc")
        djl.text = "等级"
        self.contentView.addSubview(djl)
        
        uLable = UILabel.init(frame: CGRectMake(djl.left, djl.bottom, 100, 30))
        uLable?.font = UIFont.boldSystemFontOfSize(25)
        uLable?.textColor = UIColor.colorWithHex("#333333")
        uLable?.text = "U12"
        self.contentView.addSubview(uLable!)
        
        let ksImage: UIImageView = UIImageView.init(frame: CGRectMake(180, uImage.top, uImage.with, uImage.height))
        ksImage.image = UIImage(named: "classes")
        self.contentView.addSubview(ksImage)
        
        let ksl: UILabel = UILabel.init(frame: CGRectMake(ksImage.right + 15, uImage.top, 100, 14))
        ksl.font = UIFont.systemFontOfSize(12)
        ksl.textColor = UIColor.colorWithHex("#cccccc")
        ksl.text = "课时"
        self.contentView.addSubview(ksl)
        
        ksLable = UILabel.init(frame: CGRectMake(ksl.left, ksl.bottom, 100, 30))
        ksLable?.font = UIFont.boldSystemFontOfSize(25)
        ksLable?.textColor = UIColor.colorWithHex("#333333")
        ksLable?.text = "126"
        self.contentView.addSubview(ksLable!)
    }
}