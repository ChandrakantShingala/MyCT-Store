//
//  Banner.swift
//  MyCT Store
//
//  Created by Chandrakant Shingala on 04/04/23.
//

import Foundation

struct Banner: Decodable{

    var id: Int
    var image: String
    var status: String
    var businessName: String
    var bannerId: Int

    enum CodingKeys: String, CodingKey {
        case id = "v_id"
        case image = "filename"
        case status
        case businessName = "business_name"
        case bannerId = "bid"
    }
}

//struct Banner: Decodable {
//    var id: Int
//    var status: String
//    var businessName: String
//    var bannerId: Int
//    var bannerImage: String
//
//    enum CodingKeys: String, CodingKey {
//        case vendorId = "v_id"
//        case businessName = "business_name"
//        case bannerId = "bid"
//        case image = "filename"
//        case status
//    }
//}

struct BannerViewModel{
        private let banner: Banner
        
        init(banner: Banner) {
            self.banner = banner
        }
        
        func getId() -> String{ return String(banner.id) }
        func getImageName() -> String{
            Config.baseURLForImage + (banner.image.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
        }
}
