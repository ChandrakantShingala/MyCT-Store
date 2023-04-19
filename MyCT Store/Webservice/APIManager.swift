//
//  APIManager.swift
//  MyCT Store
//
//  Created by Chandrakant Shingala on 31/03/23.
//

import Foundation
import Alamofire

class APIManager{
    
    func request(with url: String,
                 methodType: HTTPMethod = .get,
                 header: HTTPHeaders? = nil,
                 parameter: Parameters? = nil,
                 completion: @escaping (Result<Data, APIError>) -> Void) {
        
        guard let url = URL(string: url) else {
            completion(.failure(.urlDoesNotFound))
            return
        }
        
        AF.request(url, method: methodType,
                   parameters: parameter,
                   encoding: URLEncoding.default,
                   headers: header).responseData { response in
            
            guard let statusCode = response.response?.statusCode, (200...299).contains(statusCode)
            else {
                completion(.failure(.invalidResponse))
                return
            }
            guard let data = response.data
            else {
                completion(.failure(.dataNotFound))
                return
            }
            completion(.success(data))
        }
    }
}

//enum MethodType {
//    case get
//    case post
//    case put
//    case delete
//
//    var httpMethod: HTTPMethod {
//        switch self {
//        case .get: return .get
//        case .post: return .post
//        case .put: return .put
//        case .delete: return .delete
//        }
//    }
//
//    var name: String {
//        switch self {
//        case .get: return "Get"
//        case .post: return "POST"
//        case .put: return "PUT"
//        case .delete: return "DELETE"
//        }
//    }
//}

enum APIError: Error {
    case urlDoesNotFound
    case invalidResponse
    case dataNotFound
}

