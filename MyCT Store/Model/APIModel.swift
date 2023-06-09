//
//  APIModel.swift
//  MyCT Store
//
//  Created by Chandrakant Shingala on 31/03/23.
//

import Foundation

struct Area: Decodable{
    var areaName: String
    var status: String
    
    enum CodingKeys: String, CodingKey{
        case areaName = "area_name"
        case status = "stats"
    }
}
