//
//  APIRouter.swift
//  Weatherly
//
//  Created by Emir haktan Ozturk on 28.04.2019.
//  Copyright © 2019 emirhaktan. All rights reserved.
//

import Foundation

public enum APIRouter {
    
    static let baseURL = APIConstants.LINK.baseURL
    
    public func urlRequest() -> URLRequest {
        let url = URL(string: APIRouter.baseURL)
        let urlRequest = URLRequest(url: url!)
//        urlRequest.httpMethod = "GET"
        return urlRequest
    }
    
}
