//
//  Service.swift
//  Weatherly
//
//  Created by Emir haktan Ozturk on 8.04.2019.
//  Copyright © 2019 emirhaktan. All rights reserved.
//

import Foundation

class Service{

    static let sharedInstance = Service()
    
    func getDailyWeather(onSuccess: @escaping(Weather) -> (), onFailure:@escaping(Error) -> () ){
        let urlString = "https://api.darksky.net/forecast/eef5a81801f3ac883fb0ebc7bb7edd79/41.015137,28.979530?units=ca"
        
        Service.sharedInstance.loadData(with: urlString, onSuccess: { (data) in
            
            guard let data = data.data(using: .utf8) else {return}
            do{
                let weather = try JSONDecoder().decode(Weather.self, from: data)
                onSuccess(weather)
            }catch let jsonErr{
                print("Error serializing Json: ", jsonErr)
            }
            
        }) { (err) in
            print(err.localizedDescription)
        }
    }
    
    private func loadData(with url:String, onSuccess: @escaping(String) -> (), onFailure: @escaping(Error) -> Void){
        
        guard let url = URL(string: url) else {return}
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            DispatchQueue.main.async {
                if let err = error{
                    onFailure(err)
                    return
                }
                
                guard let data = data else {return}
                guard let outputStr  = String(data: data, encoding: String.Encoding.utf8) as String! else {return}
                
                onSuccess(outputStr)
            }
            }.resume()
    }
}
