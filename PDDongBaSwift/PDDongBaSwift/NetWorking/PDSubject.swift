//
//  PDSubject.swift
//  PDDongBaSwift
//
//  Created by 彭懂 on 16/8/29.
//  Copyright © 2016年 彭懂. All rights reserved.
//

import Foundation

class PDSubject: NSObject {
    var seccss: ((respons: AnyObject) -> Void)?
    var error: ((error: String) -> Void)?
    var complited: (() -> Void)?
    func successNext() {
        self.successNext(nil, fail: nil, complited: nil)
    }
    
    func successNext(success: ((respons: AnyObject) -> Void)?) {
        self.successNext(success, fail: nil, complited: nil)
    }
    
    func successNext(success: ((respons: AnyObject) -> Void)?, fail: ((error: String) -> Void)?) {
        self.successNext(success, fail: fail, complited: nil)
    }
    
    func successNext(success: ((respons: AnyObject) -> Void)?, fail: ((error: String) -> Void)?, complited: (() -> Void)?) {
        self.seccss = success
        self.error = fail
    }
    
    func sendNext(respons: AnyObject) {
        if self.seccss != nil {
            self.seccss!(respons: respons)
        }
    }
    
    func sendFail(error: String) {
        if self.error != nil {
            self.error!(error: error)
        }
    }
    
    func sendComplited() -> Void {
        if self.complited != nil {
            self.complited!()
        }
    }
}
