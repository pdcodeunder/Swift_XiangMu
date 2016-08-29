
//
//  DBTrainHeadCell.swift
//  PDDongBaSwift
//
//  Created by 彭懂 on 16/8/25.
//  Copyright © 2016年 彭懂. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class DBTrainHeadCell: UICollectionViewCell {
    
    var backImage: UIImageView?
    var titleLab: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createUI()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.createUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createUI() {
        backImage = UIImageView.init(frame: self.bounds)
        self.contentView.addSubview(backImage!)
        
//        titleLab = UILabel.init(frame: CGRectMake(10, self.height - 50, self.with, 30))
//        titleLab?.textColor = UIColor.whiteColor()
//        titleLab?.font = UIFont.boldSystemFontOfSize(18)
//        self.contentView.addSubview(titleLab!)
    }
    
    func fetchUIWithModel(model: DBTrainModel) {
        if let imageUrl = model.bannerUrl {
            self.backImage?.kf_setImageWithURL(NSURL.init(string: imageUrl))
        }
//        self.titleLab?.text = model.trainTitle
    }
}
