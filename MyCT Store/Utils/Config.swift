//
//  Config.swift
//  MyCT Store
//
//  Created by Chandrakant Shingala on 28/03/23.
//

import Foundation
import UIKit


struct Config {
    static let appName = "MyCT Store"
    static let databaseName = "myctstore.db"
    static let storeBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    static let androidLink = ""
    static let iOSLink = ""
    static let iSOSharingText: String = "Simple & easly orderyour food"
    static let appDateFormate = "dd MMM yyyy"
    static let appTimeFormate = "hh:mm a"
    static let serverDateFormate = "yyyy-MM-dd"
    static let amountSing = "₹"
    
    static func isInternetAvailabel() -> Bool{
        let reachability = Reachability()!
        return reachability.isReachable ? (reachability.isReachableViaWiFi || reachability.isReachableViaWWAN) : false
    }
    static let baseURL: String = "https://myct.store/Mobile_Services/user/v2/index.php/"
    static let baseURLForCategories = "https://myct.store/admin/uploads/food_type/"
    static let baseURLForImage = "https://myct.store/admin/uploads/"
}

