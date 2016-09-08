//
//  user.swift
//  Moyademo
//
//  Created by Shivani Pathak on 02/09/16.
//  Copyright © 2016 Shivani Pathak. All rights reserved.
//

import Foundation

import ObjectMapper

struct User:Mappable
{
    var identifier: Int!
    var name: String?
    var avatar_url: String!
    var html_url:String!
    var followers_url:String!
    var following_url:String!
    var gists_url:String!
    var type:String!

    
   init?(_ map: Map) { }
    
     mutating func mapping(map: Map) {
        identifier <- map["id"]
        name <- map["login"]
        avatar_url <- map["avatar_url"]
        html_url <- map["html_url"]
        followers_url <- map["followers_url"]
        following_url <- map["following_url"]
        gists_url <- map["gists_url"]
        type <- map["type"]
    }

}