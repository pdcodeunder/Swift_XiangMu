//
//  DBTools.swift
//  PDDongBaSwift
//
//  Created by 彭懂 on 16/8/26.
//  Copyright © 2016年 彭懂. All rights reserved.
//

import Foundation
import UIKit

//public enum UIControlContentHorizontalAlignment : Int {
//    
//    case Center
//    case Left
//    case Right
//    case Fill
//}

class DBTools: NSObject {
    /**
     *  获取字符串的宽度和高度
     */
    class func getStringRectSize(str: String, font: UIFont, size: CGSize) -> CGSize {
        
        let attributes = [NSFontAttributeName: font]
        let option = NSStringDrawingOptions.UsesLineFragmentOrigin
        let size:CGSize = str.boundingRectWithSize(size, options: option, attributes: attributes, context: nil).size
        return size;
    }
    
    /**
     *  判断网络
     */
    class func checkNetwork() {
        
    }
    
    /**
     *  string转换
     */
    class func nullString(str: AnyObject?) -> String {
        if str != nil {
            return "\(str!)"
        }
        return ""
    }
}
