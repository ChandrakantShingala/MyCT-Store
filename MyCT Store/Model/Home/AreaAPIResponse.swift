//
//  AreaAPIResponse.swift
//  MyCT Store
//
//  Created by Chandrakant Shingala on 31/03/23.
//

import Foundation

struct AreaAPIResponse: Decodable{
    var error: Bool
    var data: [Area]
}
