//
//  SearchModel.swift
//  TechNavioInsightsPlatform
//
//  Created by Sankar on 31/08/17.
//  Copyright © 2017 TechNavio. All rights reserved.
//

import Foundation

class SearchModel{
    var twitter_link        = "" as NSString
    var org_desc            = "" as NSString
    var organization_name   = "" as NSString
    var country_name        = "" as NSString
    
    init?(){}
    
    init(searchData : NSDictionary) {
        
        let _source              = searchData.value(forKey: "_source") as! NSDictionary
        self.twitter_link          = _source.value(forKey: "twitter_link") as! NSString
        self.org_desc             = _source.value(forKey: "org_desc") as! NSString
        self.organization_name      = _source.value(forKey: "organization_name") as! NSString
        self.country_name         = _source.value(forKey: "country_name") as! NSString
        
    }
}
