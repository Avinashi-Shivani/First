//
//  Githubdata.swift
//  Moyademo
//
//  Created by Shivani Pathak on 02/09/16.
//  Copyright © 2016 Shivani Pathak. All rights reserved.
//

import Foundation
import Moya

let GitHubProvider = MoyaProvider<GitHub>()

public enum GitHub {
    case users
    case UserProfile(String)
    case UserRepositories(String)
}
extension GitHub: TargetType {
    public var baseURL: NSURL { return NSURL(string: "https://api.github.com")! }

    public var path: String {
        switch self {
    
        case .users:
            return "/users"
        case .UserProfile(let name):
            return "/users/\(name.URLEscapedString)"
        case .UserRepositories(let name):
            return "/users/\(name.URLEscapedString)/repos"
        }
}

    public var method: Moya.Method {
        return .GET
}
    public var parameters: [String: AnyObject]? {
        switch self {
        case .UserRepositories(_):
            return ["sort": "pushed"]
        default:
            return nil
        }
}
    public var sampleData: NSData {
        return "".dataUsingEncoding(NSUTF8StringEncoding)!
    }
    
    public var multipartBody: [MultipartFormData]? {
        return .None
    }

}
extension String {
    var URLEscapedString: String {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())!
    }
}
