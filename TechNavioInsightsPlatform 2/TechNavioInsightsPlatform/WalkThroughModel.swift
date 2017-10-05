//
//  WalkThroughModel.swift
//  TechNavioInsightsPlatform
//
//  Created by Sankar on 04/10/17.
//  Copyright © 2017 TechNavio. All rights reserved.
//

import Foundation


struct WalkThroughModel {
    var imageName :String
    var titleText :String
    var descText  :String
    
    init(imgName :String,titleTxt :String,descTxt  :String) {
        imageName = imgName
        titleText = titleTxt
        descText = descTxt
    }
}
