//
//  HomeViewModel.swift
//  MyCT Store
//
//  Created by Chandrakant Shingala on 02/04/23.
//

import Foundation
import Alamofire

final class HomeViewModel {
    
    // MARK: Variables
    private(set) var arrCategories: [StoreTypeViewModel] = []
    private(set) var arrBanner: [BannerViewModel] = []
    private(set) var arrVendor: [VendorViewModel] = []
    private(set) var vendorCount: Int = 0
    private(set) var selectedCategoryIndex: Int = 0
    private(set) var selectedDeliveryIndex: Int = 0
    private let apiManager: APIManager = APIManager()
    
    
    func fecthDetails(completion: @escaping(Result<(), Error>) -> Void) {
        let parameter: Parameters = [ "area_id" : "4",
                                      "city_id" : "1",
                                      "custid" : "",
                                      "store_type" : selectedCategoryIndex == 0 ? "" : arrCategories[selectedCategoryIndex].getId(),
                                      "type" : selectedDeliveryIndex == 0 ? "takeaway" : "delivery"]
        
        apiManager.request(with: APIEndPoint.homepage.url, methodType: .post, parameter: parameter) { response in
            switch response {
            case .success(let data):
                do {
                    let homePageAPIResponse = try JSONDecoder().decode(HomeAPIResponse.self, from: data)
                    self.arrCategories = homePageAPIResponse.arrStoreType.map { StoreTypeViewModel(storeType: $0) }
                    self.arrBanner = homePageAPIResponse.arrBanner.map { BannerViewModel(banner: $0) }
                    self.arrVendor = homePageAPIResponse.arrVendor.map { VendorViewModel(vendor: $0) }
                    self.vendorCount = homePageAPIResponse.numberOfStores
                    print(self.arrCategories)
                    completion(.success(()))
                } catch {
                    completion(.failure(APIError.invalidResponse))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
extension HomeViewModel {
    
    func numberOfSection() -> Int {
        if arrCategories.count > 0, arrBanner.count > 0, arrVendor.count > 0{
            return 5
        }
        return 0
    }
    
    func numberOfRow() -> Int { 1 }
}

extension HomeViewModel {
    
    func update(selectedCategoryIndex: Int) {
        self.selectedCategoryIndex = selectedCategoryIndex
    }
    
    func update(selectedDeliveryIndex: Int) {
        self.selectedDeliveryIndex = selectedDeliveryIndex
    }
}

enum HomePageTabelSection {
    case address
    case category(arrCategories: [StoreTypeViewModel])
    case banner(arrBanners: [BannerViewModel])
    case deliveryOption(name: String)
    case vendor(arrVendors: [VendorViewModel])
}

