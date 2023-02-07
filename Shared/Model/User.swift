//
//  User.swift
//  Projet (iOS)
//
//  Created by marchal on 07/02/2023.
//

import Foundation
struct User: Decodable{
    var id:Int
    var firstname:String
    var lastname: String
    var age: Int
    var bio: String
    var locationID: Int
}
