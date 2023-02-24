//
//  User.swift
//  Projet (iOS)
//
//  Created by marchal on 07/02/2023.
//

import Foundation
struct User: Decodable, Hashable, Identifiable{
    var id:String
    var firstname:String
    var lastname: String
    var age: String
    var bio: String
    var locationID: String
}

struct UserResponse: Decodable {
    var records: [User]
}
