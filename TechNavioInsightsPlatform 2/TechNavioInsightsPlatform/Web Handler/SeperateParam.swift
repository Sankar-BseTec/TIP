//
//  SeperateParam.swift
//  TechNavioInsightsPlatform
//
//  Created by Sankar on 31/08/17.
//  Copyright © 2017 TechNavio. All rights reserved.
//


import UIKit
import Foundation
class SeperateParam: NSObject {
    func sepearteParameterForMethod(_ methodName : METHODNAME, parameters : NSDictionary) -> AnyObject {
        
        switch (methodName) {
        case .login :
            return self.returnLoginModelObject(parameters) as GeneralModel
            
        case .searchCard:
            return self.returnSearchModelObj(parameters) as GeneralModel
            
        default:
            return self.returnDefaultObj(parameters) as GeneralModel
            
        }
        
        
    }
    
    /**
     this will return the LoginModel object.
     */
    fileprivate func returnLoginModelObject(_ parameters : NSDictionary) -> GeneralModel {
        let gModel = GeneralModel()
        
        gModel.statusCode = "0"
        gModel.errorStatus = "1"
        gModel.errorMsg = "No data!"
        
        return gModel
    }
    
    fileprivate func returnDefaultObj(_ parameters : NSDictionary!) -> GeneralModel{
        let gModel = GeneralModel()
        
        gModel.statusCode = "0"
        gModel.errorStatus = "1"
        gModel.errorMsg = "No data!"
        
        return gModel
    }
    
    
    fileprivate func returnSearchModelObj(_ parameters : NSDictionary!) -> GeneralModel{
        let gModel = GeneralModel()
        let hitsDict : NSDictionary = parameters?.value(forKey: "hits") as! NSDictionary
        let hitsArray : NSArray = hitsDict.value(forKey: "hits") as! NSArray
        
        if hitsArray.count > 0{
            gModel.statusCode = "1"
            gModel.errorStatus = "0"
            gModel.errorMsg = ""
            for detail in hitsArray {
                let sModel = SearchModel(searchData: detail as! NSDictionary)
                gModel.searchArray.append(sModel)
            }
        }
        else{
            gModel.statusCode = "0"
            gModel.errorStatus = "1"
            gModel.errorMsg = "No data!"
        }
        return gModel
    }
}
