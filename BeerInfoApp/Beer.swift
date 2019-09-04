//
//  Beer.swift
//  BeerInfoApp
//
//  Created by C4Q on 9/4/19.
//  Copyright © 2019 Iram Fattah. All rights reserved.
//

import Foundation

struct Beer: Codable {
    let name: String
    let tagline: String
    let imageURL: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case tagline
        case imageURL = "image_url"
    }
    
    
}
