//
//  PDImageAndLableView.swift
//  PDDongBaSwift
//
//  Created by 彭懂 on 16/8/26.
//  Copyright © 2016年 彭懂. All rights reserved.
//

import Foundation
import UIKit

enum PDImageAndLableAligment {
    case left, right, center
}

class PDImageAndLableView: UIView {
    
    var imageView: UIImageView?
    var titleLable: UILabel?
    // 最后设置
    var aligment: PDImageAndLableAligment {
        get {
            return self.aligment
        }
        set {
            switch newValue {
            case .left:
                break
            case .right:
                let font: UIFont = UIFont.systemFontOfSize(12)
                let attributes = [NSFontAttributeName: font]
                let option = NSStringDrawingOptions.UsesLineFragmentOrigin
                let str: String = titleLable!.text!
                let size:CGSize = str.boundingRectWithSize(CGSizeMake(0, 20), options: option, attributes: attributes, context: nil).size
                titleLable?.with = size.width + 2
                titleLable?.right = 0
                imageView?.right = (titleLable?.left)! - 2
            case .center:
                let font: UIFont = UIFont.systemFontOfSize(12)
                let attributes = [NSFontAttributeName: font]
                let option = NSStringDrawingOptions.UsesLineFragmentOrigin
                let str: String = titleLable!.text!
                let size:CGSize = str.boundingRectWithSize(CGSizeMake(0, 20), options: option, attributes: attributes, context: nil).size
                let with: CGFloat = size.width + 2 + (imageView?.with)!
                imageView?.left = (self.with - with) / 2.0
                titleLable?.left = (imageView?.right)! + 2
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createUI() {
        imageView = UIImageView.init(frame: CGRectMake(0, 0, 12, 12))
        self.addSubview(imageView!)
        
        titleLable = UILabel.init(frame: CGRectMake(imageView!.right + 2, imageView!.top, self.with - imageView!.with - 2, imageView!.height))
        titleLable?.font = UIFont.systemFontOfSize(12)
        self.addSubview(titleLable!)
    }
}
