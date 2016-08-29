//
//  Header.swift
//  PDDongBaSwift
//
//  Created by 彭懂 on 16/8/24.
//  Copyright © 2016年 彭懂. All rights reserved.
//

import Foundation
import UIKit

// 尺寸
let kScreenWith = UIScreen.mainScreen().bounds.size.width
let kScreenHeight = UIScreen.mainScreen().bounds.size.height

// 颜色
let kWhiteColor = UIColor.whiteColor()

// 字体
let k17NormalFont: UIFont = UIFont.systemFontOfSize(17.0 / 667.0 * kScreenHeight)

// 重写YES和NO
let YES = true
let NO = false

func colorWithRGB(R: CGFloat, G: CGFloat, B: CGFloat) -> UIColor {
    return UIColor.init(red: R / 255.0, green: G / 255.0, blue: B / 255.0, alpha: 1.0)
}


