//
//  Userdetail.swift
//  Moyademo
//
//  Created by Shivani Pathak on 03/09/16.
//  Copyright © 2016 Shivani Pathak. All rights reserved.
//

import Foundation
import ObjectMapper



struct UserDetail:Mappable
{
    var avatar_url:String!
    var name:String!
    var company:String!
    var blog:String!
    var location:String!
    var email:String!
    var hireable:String!
    var public_repos:Int!
    var public_gists:Int!
    var followers:Int!
    var following:Int!
    var created_at:String!
    var updated_at:String!
    
    
    init?(_ map: Map) { }
    
    mutating func mapping(map: Map) {
        name <- map["name"]
        avatar_url <- map["avatar_url"]
        company <- map["company"]
        blog <- map["blog"]
        location <- map["location"]
        email <- map["email"]
        hireable <- map["hireable"]
        public_repos <- map["public_repos"]
        public_gists <- map["public_gists"]
        followers <- map["followers"]
        following <- map["following"]
        created_at <- map["created_at"]
        updated_at <- map["updated_at"]
    }
    
}