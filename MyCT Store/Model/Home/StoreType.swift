//
//  StoreType.swift
//  MyCT Store
//
//  Created by Chandrakant Shingala on 04/04/23.
//

import Foundation

struct StoreType: Decodable {
    var id: String
    var type: String
    var image: String
}

struct StoreTypeViewModel: Decodable {
    private let storeType: StoreType
    
    init(storeType: StoreType) {
        self.storeType = storeType
    }
    func getId() -> String {  return storeType.id }
    func getName() -> String { return storeType.type }
    func getImageName() -> String {
        return Config.baseURLForCategories + (storeType.image.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
    }
}
