//
//  Model.swift
//  VKApp
//
//  Created by Artur Gedakyan on 17.03.2021.
//

import Foundation

struct Users {
    var name: String
    var userImage: String
}

struct Community {
    var name: String
    var userImage: String
    var subsctiber: String
}

struct Post {
    var smallImageUser: String
    var nameImageView: String
    var likeCount: String
    var postName: String
}

struct Section {
    let letter : String
    let names : [String]
}
