//
//  ServiceManagerProtocol.swift
//  Weatherly
//
//  Created by Emir haktan Ozturk on 28.04.2019.
//  Copyright © 2019 emirhaktan. All rights reserved.
//

import Foundation

enum Result <T, E>{
    case success(T)
    case error(E)
}

protocol ServiceManagerProtocol{
    func fetchDataWith(completion: @escaping (Result<Data?, Error?>) -> Void)
}
