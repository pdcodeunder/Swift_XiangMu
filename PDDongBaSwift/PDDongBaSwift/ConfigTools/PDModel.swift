//
//  PDModel.swift
//  PDDongBaSwift
//
//  Created by 彭懂 on 16/8/25.
//  Copyright © 2016年 彭懂. All rights reserved.
//

import Foundation

public class PDModel: NSObject {
    // 重新init方法 需要的时候
    required override public init() {
        super.init()
    }
    
    // json转model  <T> 泛型函数
    public class func jsonToModel<T>(dics: AnyObject?) -> T! {
        if nil == dics {
            return nil
        }
        var dic: AnyObject!
        if dics is NSArray {
            dic = dics!.lastObject
        } else {
            dic = dics
        }
        // 创建model对象
        let obj: AnyObject = self.init()
        let properties: Mirror! = Mirror(reflecting: obj)
        if dic != nil {
            if let b = AnyBidirectionalCollection(properties.children) {
                for i in b.startIndex ..< b.endIndex {
                    let pro = b[i]
                    let key = pro.0
                    let type = pro.1
                    switch type {
                    case is Int, is Int64, is NSInteger:
                        let value = dic.objectForKey(key)?.integerValue
                        if value != nil {
                            obj.setValue(value, forKey: key!)
                        }
                    case is Float, is Double, is Bool, is NSNumber:
                        let value: AnyObject! = dic.objectForKey(key)
                        if value != nil {
                            obj.setValue(value, forKey: key!)
                        }
                    case is String:
                        let value: AnyObject! = dic?.objectForKey(key!)
                        if value != nil{
                            obj.setValue(value.description, forKey: key!)
                        }
                        break
                        
                    case is Array<String>:  //arr string
                        if let nsarray = dic?.objectForKey(key!) as? NSArray {
                            var array:Array<String> = []
                            for el in nsarray {
                                if let typedElement = el as? String {
                                    array.append(typedElement)
                                }
                            }
                            obj.setValue(array, forKey: key!)
                        }
                        break
                        
                        
                    case is Array<Int>:   //arr int
                        if let nsarray = dic?.objectForKey(key!) as? NSArray {
                            var array:Array<Int> = []
                            for el in nsarray {
                                if let typedElement = el as? Int {
                                    array.append(typedElement)
                                }
                            }
                            obj.setValue(array, forKey: key!)
                        }
                        break
                        
                    default:     //unknow
                        let otherType = Mirror(reflecting: type).subjectType
                        
                        switch otherType{
                        case is Optional<String>.Type,is Optional<NSNumber>.Type,is Optional<NSInteger>.Type,is Optional<Array<String>>.Type,is Optional<Array<Int>>.Type:
                            obj.setValue(dic?.objectForKey(key!), forKey: key!)
                            break
                            
                        default:
                            let name:NSString = String(otherType)
                            let className = getClassName(name) as String
                            let clz:AnyClass! = NSClassFromString(className)
                            
                            if clz != nil{
                                if let data = dic.objectForKey(key!) as? NSArray{
                                    let value = clz.jsonToModelList(data)
                                    obj.setValue(value, forKey: key!)
                                }
                                else{
                                    let value = dic.objectForKey(key!)
                                    obj.setValue((clz as! PDModel.Type).jsonToModel(value),forKey:key!)
                                }
                            }
                            else{
                                print("unknown property")
                            }
                            break
                        }
                    }
                }
            }
        } else {
            return nil
        }
        return (obj as! T)
    }
    
    //MARK: json转到model list,传入anyobject
    public class func jsonToModelList(data:AnyObject?)->Array<AnyObject>{
        if data == nil{
            return []
        }
        
        var objs:Array<AnyObject> = []
        if let dics = data as? NSArray{
            for i in 0  ..< dics.count {
                let dic:AnyObject = dics[i]
                objs.append(jsonToModel(dic))
            }
        }
        return objs
    }
    
    //从一串Optional<*******>找到类名字符串
    private class func getClassName(name:NSString)->NSString!{
        var range = name.rangeOfString("<.*>", options: NSStringCompareOptions.RegularExpressionSearch)
        if range.location != NSNotFound{
            range.location += 1
            range.length -= 2
            return getClassName(name.substringWithRange(range))
        }
        else{
            return name
        }
    }
}