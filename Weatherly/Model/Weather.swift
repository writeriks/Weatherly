//
//  Weather.swift
//  Weatherly
//
//  Created by Emir haktan Ozturk on 8.04.2019.
//  Copyright © 2019 emirhaktan. All rights reserved.
//

import Foundation

class Weather: Codable {
    let timezone : String
    let daily : Daily
}

class Daily: Codable {
    let data : [Data]
}

class Data: Codable {
    let summary : String?
    let icon : String?
    let temperatureMax : Double?
    let humidity : Double?
    let pressure : Double?
    let windSpeed : Double?
    let time: Double?
    
    
    private enum CodingKeys: String, CodingKey {
        case summary = "summary", icon = "icon", temperatureMax = "temperatureMax", humidity = "humidity", pressure = "pressure", windSpeed = "windSpeed", time = "time"
    }
    
    init(summary:String, icon:String,temperatureMax:Double,humidity:Double,pressure:Double,windSpeed:Double,time:Double){
        self.summary = summary
        self.icon = icon
        self.temperatureMax = temperatureMax
        self.humidity = humidity
        self.pressure = pressure
        self.windSpeed = windSpeed
        self.time = time
    }
    
    required init(from decoder:Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        summary = try container.decodeIfPresent(String.self, forKey: .summary)
        icon = try container.decodeIfPresent(String.self, forKey: .icon)
        temperatureMax = try container.decodeIfPresent(Double.self, forKey: .temperatureMax)
        humidity = try container.decodeIfPresent(Double.self, forKey: .humidity)
        pressure = try container.decodeIfPresent(Double.self, forKey: .pressure)
        windSpeed = try container.decodeIfPresent(Double.self, forKey: .windSpeed)
        time = try container.decodeIfPresent(Double.self, forKey: .time)
    }
}


