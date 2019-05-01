//
//  APIRouter.swift
//  Weatherly
//
//  Created by Emir haktan Ozturk on 28.04.2019.
//  Copyright © 2019 emirhaktan. All rights reserved.
//

import Foundation

enum APIRouter {
    
    static let baseURL = APIConstants.LINK.baseURL
    
    case fetchAll
    
    var headers : [String:String]{
        switch self{
        case .fetchAll:
            return [:]
        }
    }
    
    var body : Data?{
        switch self{
        case .fetchAll:
            return nil
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchAll:
            return HTTPMethod.GET
        }
    }
    
    var request : URLRequest {
        let url = URL(string: APIRouter.baseURL)
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = self.method.rawValue
        urlRequest.allHTTPHeaderFields = self.headers
        urlRequest.httpBody = self.body
        return urlRequest
    }
    
}
