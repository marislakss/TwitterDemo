//
//  Tweet.swift
//  TwitterDemo
//
//  Created by Māris Lakšs on 10/04/2023.
//

import Foundation

struct Tweet: Decodable {
    var id: Int
    var username: String
    var nickname: String
    var created: String
    var message: String
    var message_image: String?
    var replies: Int
    var retweets: Int
    var favorited: Int
    var avatar_image: String
}
