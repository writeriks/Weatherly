//
//  DataStore.swift
//  Weatherly
//
//  Created by Emir haktan Ozturk on 28.04.2019.
//  Copyright © 2019 emirhaktan. All rights reserved.
//

import Foundation

class DataStore: NSObject {
    
    let serviceManager:ServiceManagerProtocol!
    private weak var uiUpdater:UIUpdaterProtocol!
    
    init(with serviceManager:ServiceManagerProtocol = Service.shared(), uiUpdater: UIUpdaterProtocol) {
        self.serviceManager = serviceManager
        self.uiUpdater = uiUpdater
        super.init()
    }
    
    func fetchWeatherData(){
        serviceManager.fetchDataWith {[weak self] (result) in
            switch result{
            case .success(let data):
                let decoder = JSONDecoder()
                do{
                    let json = try decoder.decode(Weather.self, from: data!)
                    self?.uiUpdater?.updateUI(weather: json)
                }catch(let ex){
                    print(ex.localizedDescription)
                }
            case .error(let error):
                print(error.debugDescription)
            }
        }
    }
}
