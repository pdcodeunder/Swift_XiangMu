//
//  DBUserInfo.swift
//  PDDongBaSwift
//
//  Created by 彭懂 on 16/8/29.
//  Copyright © 2016年 彭懂. All rights reserved.
//

import Foundation

class DBUserInfo: NSObject {
    var userId: String?
    var userName: String?
    
    // 单例
    class var sharedDNUserInfo: DBUserInfo {
        struct SharedConfigStruct {
            static var configOnce: dispatch_once_t = 0
            static var sharedUserInfo: DBUserInfo?
        }
        dispatch_once(&SharedConfigStruct.configOnce) { 
            SharedConfigStruct.sharedUserInfo = DBUserInfo()
        }
        return SharedConfigStruct.sharedUserInfo!
    }
}
