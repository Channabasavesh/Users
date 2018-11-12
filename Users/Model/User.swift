//
//  User.swift
//  Users
//
//  Created by channabasavesh chandrappa budihal on 11/11/18.
//  Copyright © 2018 channabasavesh chandrappa budihal. All rights reserved.
//

import Foundation

struct User: Codable {
    
    var id: Int
    var name: String
    var username: String
    var email: String
    var address: Address
    var phone: String
    var website: String
    var company: Company
    
    struct Address: Codable {
        var street: String
        var suite: String
        var city: String
        var zipcode: String
        var geo: Geo
        
        struct Geo: Codable {
            var lat: String
            var lng: String
        }
    }
    
    struct Company: Codable {
        var name: String
        var catchPhrase: String
        var businessService: String
        
        enum CodingKeys: String, CodingKey {
            case name
            case catchPhrase
            case businessService = "bs"
        }
    }
}
