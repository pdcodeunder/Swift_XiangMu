//
//  UIView+PDExtend.swift
//  PDDongBaSwift
//
//  Created by 彭懂 on 16/8/25.
//  Copyright © 2016年 彭懂. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    //
    var left: CGFloat! {
        get {
            return self.frame.origin.x
        }
        set {
            var frame: CGRect = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    var right: CGFloat! {
        get {
            return self.frame.origin.x + self.frame.size.width
        }
        set {
            let delta: CGFloat = newValue - (self.frame.origin.x + self.frame.size.width)
            var newFrame: CGRect = self.frame
            newFrame.origin.x += delta
            self.frame = newFrame
        }
    }
    var top: CGFloat! {
        get {
            return self.frame.origin.y
        }
        set {
            var newFrame: CGRect = self.frame
            newFrame.origin.y = newValue
            self.frame = newFrame
        }
    }
    var bottom: CGFloat! {
        get {
            return self.frame.origin.y + self.frame.size.height
        }
        set {
            let delat: CGFloat = newValue - (self.frame.origin.y + self.frame.size.height)
            var newFrame: CGRect = self.frame
            newFrame.origin.y += delat
            self.frame = newFrame
        }
    }
    
    // 长和宽
    var with: CGFloat! {
        get {
            return self.bounds.size.width
        }
        set {
            var newFrame: CGRect = self.frame
            newFrame.size.width = newValue
            self.frame = newFrame
        }
    }
    
    var height: CGFloat! {
        get {
            return self.bounds.height
        }
        set {
            var newFrame: CGRect = self.frame
            newFrame.size.height = newValue
            self.frame = newFrame
        }
    }
}

