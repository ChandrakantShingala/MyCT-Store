//
//  OrderData.swift
//  MyCT Store
//
//  Created by Chandrakant Shingala on 11/04/23.
//

import Foundation

struct OrderData: Decodable{
    var orderId: Int
    var vendorName: String
    var dateAndTime: String
    var vendorImage: String
    var totalPrice: Float
    var status: String
    
    enum CodingKeys: String, CodingKey {
        case orderId = "order_id"
        case vendorName = "vname"
        case dateAndTime = "date_time"
        case vendorImage = "vimage"
        case totalPrice = "tprice"
        case status = "stats"
    }
}
