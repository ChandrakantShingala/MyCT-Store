//
//  OrderDataTypeViewModel.swift
//  MyCT Store
//
//  Created by Chandrakant Shingala on 11/04/23.
//

import Foundation

struct OrderDataTypeViewModel{
    
    private let orderData: OrderData
    
    init(orderData: OrderData) {
        self.orderData = orderData
    }
    
    func getOrderId() -> String { String(orderData.orderId) }
    func getVendorName() -> String { orderData.vendorName }
    func getOrderImageName() -> String {
         return Config.baseURLForImage + (orderData.vendorImage.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") }
    func getDataAndTime() -> String { orderData.dateAndTime }
    func getOrderStatus() -> String { orderData.status }
    func getTotalPrice() -> String { String(orderData.totalPrice) }
}
