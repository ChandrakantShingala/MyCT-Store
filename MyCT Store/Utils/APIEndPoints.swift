//
//  APIEndPoints.swift
//  MyCT Store
//
//  Created by Chandrakant Shingala on 31/03/23.
//

import Foundation

enum APIEndPoint{
    case getArea
    case getCity
    case homepage
    case myOrder
    
    var url: String{
        switch self {
        case .getArea:
            return "\(Config.baseURL)/get_area"
        case .getCity:
            return "\(Config.baseURL)/get_city"
        case .homepage:
            return "\(Config.baseURL)/homepage"
        case .myOrder:
            return "\(Config.baseURL)/get_order/8"
        }
    }
}
