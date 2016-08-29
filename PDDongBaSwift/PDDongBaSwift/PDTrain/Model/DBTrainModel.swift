//
//  DBTrainModel.swift
//  PDDongBaSwift
//
//  Created by 彭懂 on 16/8/25.
//  Copyright © 2016年 彭懂. All rights reserved.
//

import Foundation

class DBTrainModel: PDModel {
    var tainImageURL: String?
    var bannerUrl: String?
    var trainTitle: String?
    var trainPlayCount: String?
    var trainCollectionCount: String?
    var trainTime: String?
    var trainId: String?
    var trainAgeGroup: String?
    var trainDesc: String?
    var trainDiff: String?
    var trainIsCollection: String?
    var trainRecommend: String?
    
    class func createTrainModel(dic: [String: AnyObject]) -> DBTrainModel {
        let model: DBTrainModel = DBTrainModel()
        model.tainImageURL = DBTools.nullString(dic["cover_url"])
        model.bannerUrl = DBTools.nullString(dic["banner_url"])
        model.trainTitle = DBTools.nullString(dic["title"])
        model.trainPlayCount = DBTools.nullString(dic["play_count"])
        model.trainCollectionCount = DBTools.nullString(dic["collection_count"])
        model.trainTime = DBTools.nullString(dic["duration"])
        model.trainId = DBTools.nullString(dic["id"])
        model.trainAgeGroup = DBTools.nullString(dic["age_group_name"])
        model.trainDesc = DBTools.nullString(dic["desc"])
        model.trainDiff = DBTools.nullString(dic["difficulty"])
        model.trainIsCollection = DBTools.nullString(dic["is_collected"])
        model.trainRecommend = DBTools.nullString(dic["recommend_url"])
        return model
    }
}
