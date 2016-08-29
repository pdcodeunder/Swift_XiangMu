
//
//  DBTrainNetwork.swift
//  PDDongBaSwift
//
//  Created by 彭懂 on 16/8/29.
//  Copyright © 2016年 彭懂. All rights reserved.
//

import Foundation

class DBTrainNetwork: NSObject {
    /**
     首页网络请求
     */
    class func myTrainPageNetwork(usrId: String) -> PDSubject {
        let subject: PDSubject = PDSubject()
        let urlStr: String = kDBNetwork_Saver + kDBNetwork_TrainMain
        let dic: [String: AnyObject] = ["user_id": usrId]
        
        PDHttpNetworking.httpPOST(url: urlStr, parameters: dic, succssBlock: { (parse) in
            let responseDic: [String: AnyObject] = parse.responseDic!
            subject.sendNext(responseDic)
            subject.sendComplited()
            }) { (Rerror) in
                subject.sendFail(Rerror)
                subject.sendComplited()
        }
        return subject
    }
    
    
}
