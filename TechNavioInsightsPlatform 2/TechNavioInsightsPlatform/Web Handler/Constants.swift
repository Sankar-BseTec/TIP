//
//  Constants.swift
//  TechNavioInsightsPlatform
//
//  Created by Sankar on 31/08/17.
//  Copyright © 2017 TechNavio. All rights reserved.
//

import Foundation



enum METHODTYPE {
    case GET
    case POST
}

enum METHODNAME {
    
    case login
    case searchCard
    case getnotifications
    case rfplist
}

enum URLTYPE {
    
    case login
    case searchCard
}


let TIP_BASE_URL = "http://alpha.teambv.us/"

let API_LOGIN    = "bhapi/services/login"
let API_SEARCH   = "bhapi/services/Search"
let API_GET_NOTIFICATIONS   = "bhapi/services/getnotifications"
let API_GET_RFP_LIST   = "bhapi/services/rfpList"
