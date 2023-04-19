//
//  Home.swift
//  MyCT Store
//
//  Created by Chandrakant Shingala on 02/04/23.
//

import Foundation

struct Vendor: Decodable {
    var id: String
    var name: String
    var image: String
    var area: String
    var address: String
    var deliveryTime: String
    var deliveryTimeIn: String
    var minOrder: String
    var deliveryCharge: String
    var discount: String
    var favouriteVender: String
    var rating: String
    var stats: String
    var isOpen: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, image, area, address, discount, rating, stats
        case deliveryTime = "delivery_time"
        case deliveryTimeIn = "delivery_time_in"
        case minOrder = "min_order"
        case deliveryCharge = "delivery_charges"
        case favouriteVender = "favouriteRestau"
        case isOpen = "isopen"
    }
}

struct VendorViewModel: Decodable {
    private let vendor: Vendor
    
    init(vendor: Vendor) {
        self.vendor = vendor
    }
    func getId() -> String { vendor.id }
    func getName() -> String { vendor.name }
    func getImageName() -> String {
        return Config.baseURLForImage + (vendor.image.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
    }
    func isOpen() -> Bool { vendor.isOpen == "open" }
    func getMinimumOrder() -> String { "Min. Order: $\(vendor.minOrder)" }
    func getDeliveryCharges() -> String {
        return String(format: "Delivery Fees: $%f", Float(vendor.deliveryCharge) ?? 0)
    }
    func getRating() -> Float { return Float(vendor.rating) ?? 0}
    func isFav() -> Bool{ vendor.favouriteVender == "yes" }
}
