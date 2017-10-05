//
//  HelperClass.swift
//  TechNavioInsightsPlatform
//
//  Created by Sankar on 31/08/17.
//  Copyright © 2017 TechNavio. All rights reserved.
//

import Foundation

class HelperClass {
    
    let config = URLSessionConfiguration.default
    let session = URLSession.shared
    
    
    
    func httpRequestWithMethodName(_ methodType :NSString,   _ methodName: METHODNAME, headers : NSDictionary!,urlParam : NSString, success: @escaping (_ result: AnyObject?)->(), failure: @escaping (_ result: AnyObject?)->()) {
        
        if Reachability.isConnectedToNetwork() == true
        {
            var getURL = ReturnUrlClass().returnUrlForMethod(methodName, parameters: headers) as String
            getURL = (getURL as String) + (urlParam as String)
            
            guard let urlValue = NSURL(string: getURL)
                else {
                    print("Error: cannot create URL")
                    return
            }
            print("API Link :",urlValue)
            
            let request =  NSMutableURLRequest(url:urlValue as URL)
            request.httpMethod = methodType as String
            
            self.getResponseAPI(request as URLRequest) { (result, error) in
                print("inside completion main thread: \(Thread.isMainThread)")
                if result == nil {
                    let error = WarningMessageHandler(error: ["message":"No data available!"])
                    failure(error)
                } else {
                    let retVal : AnyObject = SeperateParam().sepearteParameterForMethod(methodName, parameters: result as! NSDictionary)
                    success(retVal)
                }
                
            }
        }
        else
        {
            let error = WarningMessageHandler(error: ["message":"Please Check Your Internet Connection"])
            print(error.value(forKey: "message") ?? "")
            failure(error)
        }
    }

    
    
    fileprivate func getResponseAPI(_ req : URLRequest, completion: @escaping (_ result: AnyObject?, _ error: AnyObject?)->()) {
        
        print("before main thread: \(Thread.isMainThread)")
        let task = session.dataTask(with: req,
                                    completionHandler: { (responseData:Data?,
                                        response:URLResponse?,
                                        error:Error?)in
                                        
                                        print("after main thread: \(Thread.isMainThread)")
                                        if let httpResponse = response as? HTTPURLResponse {
                                            print("Status code:", httpResponse.statusCode)
                                            if httpResponse.statusCode == 200 || httpResponse.statusCode == 201 {
                                                
                                                /*   if responseData != nil {
                                                 let json = NSString(data: responseData!, encoding: String.Encoding.utf8.rawValue) as! String
                                                 print("json: \(json)")
                                                 }*/
                                                // use anyObj here
                                                
                                                do{
                                                    let MyData = try JSONSerialization.jsonObject(with: responseData!, options: JSONSerialization.ReadingOptions.mutableContainers)
                                                    print("JSON Result :\(MyData)")
                                                    completion(MyData as AnyObject?, nil)
                                                }
                                                catch let error as NSError{
                                                    print(error.description)
                                                }
                                                
                                            } else if httpResponse.statusCode == 404 || httpResponse.statusCode == 401 {
                                                let msg = ["message":"Status Code 404" ] as NSDictionary
                                                completion(nil, msg)
                                            }
                                            else {
                                                let ERROR = ["message":"Could not reach to server!"]
                                                completion(nil, ERROR as AnyObject?)
                                            }
                                            
                                        }
        })
        task.resume()
        
    }
    
}
