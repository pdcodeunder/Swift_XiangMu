//
//  PDHttpNetworking.swift
//  PDDongBaSwift
//
//  Created by 彭懂 on 16/8/29.
//  Copyright © 2016年 彭懂. All rights reserved.
//

import Foundation
import SwiftHTTP

class PDHttpNetworking: NSObject {
    // GET
    class func httpGET(url url: String, parameters: Dictionary<String, AnyObject>) {
        PDHttpNetworking.httpGET(url: url, parameters: parameters, succssBlock: nil, resError: nil)
    }
    
    class func httpGET(url url: String, parameters: Dictionary<String, AnyObject>, succssBlock: ((parse: PDHttpParse) -> Void)?) {
        PDHttpNetworking.httpGET(url: url, parameters: parameters, succssBlock: succssBlock, resError: nil)
    }
    
    // POST
    class func httpPOST(url url: String, parameters: Dictionary<String, AnyObject>) {
        PDHttpNetworking.httpPOST(url: url, parameters: parameters, succssBlock: nil, resError: nil)
    }
    
    class func httpPOST(url url: String, parameters: Dictionary<String, AnyObject>, succssBlock: ((parse: PDHttpParse) -> Void)?) {
        PDHttpNetworking.httpPOST(url: url, parameters: parameters, succssBlock: succssBlock, resError: nil)
    }
    
    // 实现方法
    class func httpPOST(url url: String, parameters: Dictionary<String, AnyObject>, succssBlock: ((parse: PDHttpParse) -> Void)?, resError: ((Rerror: String) -> Void)?) {
        do {
            let opt = try HTTP.POST(url, parameters: parameters)
            opt.start { response in
                if let error = response.error {
                    if resError != nil {
                        resError!(Rerror: error.description)
                    }
                    return
                }
                let pars: PDHttpParse = PDHttpParse()
                pars.responseData = response.data
                if succssBlock != nil {
                    succssBlock!(parse: pars)
                }
            }
        } catch let error {
            if resError != nil {
                resError!(Rerror: "\(error)")
            }
        }
    }
    
    class func httpGET(url url: String, parameters: Dictionary<String, AnyObject>, succssBlock: ((parse: PDHttpParse) -> Void)?, resError: ((Rerror: String) -> Void)?) {
        do {
            let opt = try HTTP.GET(url, parameters: parameters)
            opt.start { response in
                if let error = response.error {
                    if resError != nil {
                        resError!(Rerror: error.description)
                    }
                    return
                }
                let pars: PDHttpParse = PDHttpParse()
                pars.responseData = response.data
                if succssBlock != nil {
                    succssBlock!(parse: pars)
                }
            }
        } catch let error {
            if resError != nil {
                resError!(Rerror: "\(error)")
            }
        }
    }
}
