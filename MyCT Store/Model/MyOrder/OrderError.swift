//
//  OrderError.swift
//  MyCT Store
//
//  Created by Chandrakant Shingala on 11/04/23.
//

import Foundation

struct MyOrder: Decodable {
    var error: Bool
    var data: [OrderData]
}
