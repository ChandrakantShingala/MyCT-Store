//
//  MyOrderViewModel.swift
//  MyCT Store
//
//  Created by Chandrakant Shingala on 11/04/23.
//

import Foundation
import Alamofire

final class MyOrderViewModel{
    
    private(set) var arrOrders: [OrderDataTypeViewModel] = []
    private let apiManager: APIManager = APIManager()
    
    func fecthDetails(completion: @escaping(Result<(), Error>) -> Void){
        apiManager.request(with: APIEndPoint.myOrder.url, methodType: .get) { response in
            switch response {
            case .success(let data):
                do{
                    let myOrderPageAPIResponse = try JSONDecoder().decode(MyOrder.self, from: data)
                    print(myOrderPageAPIResponse)
                    self.arrOrders = myOrderPageAPIResponse.data.map { OrderDataTypeViewModel(orderData: $0) }
                    completion(.success(()))
                } catch {
                    print(error)
                    completion(.failure(APIError.dataNotFound))
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}


extension MyOrderViewModel{
    func numberOfSection() -> Int{
        return arrOrders.count
    }
    
    func numberOfRow() -> Int { 1 }
}
