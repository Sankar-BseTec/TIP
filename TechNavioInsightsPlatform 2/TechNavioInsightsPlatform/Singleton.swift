//
//  Singleton.swift
//  TechNavioInsightsPlatform
//
//  Created by Sankar on 13/09/17.
//  Copyright © 2017 TechNavio. All rights reserved.
//

import Foundation



class Singleton{
    
    static var instance = Singleton()
    
    var nameUser : String = ""
    
    private init(){
        
    }
    
    func setValue(name : String){
        self.nameUser = name
    }
    
    func getValue() -> String {
        return self.nameUser
    }
}
