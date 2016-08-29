//
//  UIColor+HexColor.swift
//  PDDongBaSwift
//
//  Created by 彭懂 on 16/8/24.
//  Copyright © 2016年 彭懂. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    public class func colorWithHex(hexString: String) -> UIColor {
        let characterSet: NSCharacterSet = NSCharacterSet.whitespaceAndNewlineCharacterSet()
        var cString: String = hexString.stringByTrimmingCharactersInSet(characterSet).uppercaseString
        // 判断色值长度小于6位返回透明色
        if cString.characters.count < 6{
            return UIColor.clearColor()
        }
        // 判断色值类型
        if cString.hasPrefix("0x") {
            cString = cString.substringFromIndex(cString.startIndex.advancedBy(2))
        }
        if cString.hasPrefix("#") {
            cString = cString.substringFromIndex(cString.startIndex.advancedBy(1))
        }
        if cString.characters.count != 6 {
            return UIColor.clearColor()
        }
        
        // 分解色值
        var range: Range = Range(cString.startIndex.advancedBy(0) ..< cString.startIndex.advancedBy(2))
        // r
        let rString: String = cString.substringWithRange(range)
        
        // g
        range.startIndex = range.startIndex.advancedBy(2)
        range.endIndex = range.startIndex.advancedBy(2)
        let gString: String = cString.substringWithRange(range)
        
        // b
        range.startIndex = range.startIndex.advancedBy(2)
        range.endIndex = range.startIndex.advancedBy(2)
        let bString: String = cString.substringWithRange(range)
        
        var r, g, b : UInt32;
        r = 0; g = 0; b = 0;
        // 扫描值并复制给rgb
        NSScanner.localizedScannerWithString(rString).scanHexInt(&r)
        NSScanner.localizedScannerWithString(gString).scanHexInt(&g)
        NSScanner.localizedScannerWithString(bString).scanHexInt(&b)
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: 1.0)
    }
}

