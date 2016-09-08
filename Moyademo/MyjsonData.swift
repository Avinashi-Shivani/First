//
//  MyjsonData.swift
//  Moyademo
//
//  Created by Shivani Pathak on 02/09/16.
//  Copyright © 2016 Shivani Pathak. All rights reserved.
//

import Foundation
import Moya

private func JSONResponseDataFormatter(data: NSData) -> NSData {
    do {
        let dataAsJSON = try NSJSONSerialization.JSONObjectWithData(data, options: [])
        let prettyData =  try NSJSONSerialization.dataWithJSONObject(dataAsJSON, options: .PrettyPrinted)
        return prettyData
    } catch {
        return data //fallback to original data if it cant be serialized
    }
}
let provider=MoyaProvider<mydata>()
public enum mydata
{
    case Samples
}
extension mydata:TargetType
{
    public var baseURL: NSURL { return NSURL(string: "http://www.learnswiftonline.com")! }
    
    public var path: String {
        switch self {
        case .Samples:
            return "/Samples/subway.json"
       
        }
    }
    
    public var method: Moya.Method {
        return .GET
    }
    public var parameters: [String: AnyObject]?
    {
            return nil
    }
    
    public var sampleData: NSData {
    return NSData()
    }
    
    public var multipartBody: [MultipartFormData]? {
        return .None
    }
    


}