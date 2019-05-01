//
//  Service.swift
//  Weatherly
//
//  Created by Emir haktan Ozturk on 8.04.2019.
//  Copyright © 2019 emirhaktan. All rights reserved.

import Foundation

class Service :NSObject{

    private override init() {
    }
    
    static let sharedInstance = Service()
    
    class func shared()-> Service{
        return sharedInstance
    }
}

extension Service: ServiceManagerProtocol{
    func fetchDataWith(completion: @escaping (Result<Data?, Error?>) -> Void) {
        
        let urlRequest = APIRouter.fetchAll.request
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            DispatchQueue.main.async {
                if let err = error{completion(.error(err))}
                
                guard let data = data else {return}
                completion(.success(data))
            }
        }.resume()
    }
}
