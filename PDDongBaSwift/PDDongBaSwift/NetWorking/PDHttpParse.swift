//
//  PDHttpParse.swift
//  PDDongBaSwift
//
//  Created by 彭懂 on 16/8/29.
//  Copyright © 2016年 彭懂. All rights reserved.
//

import Foundation

class PDHttpParse: NSObject {
    var errorStr: String?
    var responseDic: [String: AnyObject]?
    var responseData: NSData {
        get {
            return self.responseData
        }
        set {
            do {
            let opt = try NSJSONSerialization.JSONObjectWithData(newValue, options: NSJSONReadingOptions.MutableContainers)
            responseDic = opt as? [String : AnyObject]
            } catch let error {
                print("error:  \(error)")
            }
        }
    }
    
}