//
//  ReturnUrlClass.swift
//  TechNavioInsightsPlatform
//
//  Created by Sankar on 31/08/17.
//  Copyright © 2017 TechNavio. All rights reserved.
//

import Foundation


class ReturnUrlClass: NSObject {
    
    func returnUrlForMethod(_ methodName : METHODNAME, parameters : NSDictionary!) -> NSString {
        switch (methodName) {
        case .login :
            let urlValue = TIP_BASE_URL + API_LOGIN as NSString
            return urlValue
        case .searchCard:
            let urlValue = TIP_BASE_URL + API_SEARCH as NSString
            return urlValue
        case .getnotifications:
            let urlValue = TIP_BASE_URL + API_GET_NOTIFICATIONS as NSString
            return urlValue
        case .rfplist:
            let urlValue = TIP_BASE_URL + API_GET_RFP_LIST as NSString
            return urlValue
        }
    }
    
}


class WarningMessageHandler: NSObject {
    let message         : String
    /**
     Note: Initialize with Service response.
     */
    init(error : NSDictionary!) {
        self.message        = error.value(forKey: "message") as! String
    }
}
