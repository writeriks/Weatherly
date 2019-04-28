//
//  Weather.swift
//  Weatherly
//
//  Created by Emir haktan Ozturk on 8.04.2019.
//  Copyright © 2019 emirhaktan. All rights reserved.
//

import Foundation

class Weather: Codable {
    
    let timezone: String?
    let dailyDatas : [DailyData]?
    
    private enum CodingKeys: String, CodingKey{
        case timezone, daily, data
    }
    
    init(timezone:String, dailyData : [DailyData]){
        self.timezone = timezone
        self.dailyDatas = dailyData
    }
    
    required init(from decoder:Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.timezone = try container.decodeIfPresent(String.self, forKey: .timezone)
        let daily = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .daily)
        self.dailyDatas = try daily.decode([DailyData].self, forKey: .data)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(timezone, forKey: .timezone)
        _ = container.nestedContainer(keyedBy: CodingKeys.self, forKey: .daily)
    }
}

class DailyData:Codable{
    var summary: String?
    let temperatureMax: Double?
    let humidity : Double?
    let pressure : Double?
    let windSpeed : Double?
    let time: Double?
    
    private enum DataKeys: String, CodingKey{
        case summary, temperatureMax, humidity, pressure, windSpeed, time
    }
    
    init(summary:String, temperatureMax:Double,humidity:Double,pressure:Double,windSpeed:Double,time:Double){
        self.summary = summary
        self.temperatureMax = temperatureMax
        self.humidity = humidity
        self.pressure = pressure
        self.windSpeed = windSpeed
        self.time = time
    }
    
    required init(from decoder:Decoder) throws{
        let container = try decoder.container(keyedBy: DataKeys.self)
        summary = try container.decodeIfPresent(String.self, forKey: .summary)
        temperatureMax = try container.decodeIfPresent(Double.self, forKey: .temperatureMax)
        humidity = try container.decodeIfPresent(Double.self, forKey: .humidity)
        pressure = try container.decodeIfPresent(Double.self, forKey: .pressure)
        windSpeed = try container.decodeIfPresent(Double.self, forKey: .windSpeed)
        time = try container.decodeIfPresent(Double.self, forKey: .time)
    }
}


//class Weather: Codable {
//    let timezone : String
//    let daily : Daily
//}
//
//class Daily: Codable {
//    let data : [Data]
//}
//
//class Data: Codable {
//    let summary : String?
//    let icon : String?
//    let temperatureMax : Double?
//    let humidity : Double?
//    let pressure : Double?
//    let windSpeed : Double?
//    let time: Double?
//
//
//    private enum CodingKeys: String, CodingKey {
//        case summary = "summary", icon = "icon", temperatureMax = "temperatureMax", humidity = "humidity", pressure = "pressure", windSpeed = "windSpeed", time = "time"
//    }
//
//    init(summary:String, icon:String,temperatureMax:Double,humidity:Double,pressure:Double,windSpeed:Double,time:Double){
//        self.summary = summary
//        self.icon = icon
//        self.temperatureMax = temperatureMax
//        self.humidity = humidity
//        self.pressure = pressure
//        self.windSpeed = windSpeed
//        self.time = time
//    }
//
//    required init(from decoder:Decoder) throws{
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        summary = try container.decodeIfPresent(String.self, forKey: .summary)
//        icon = try container.decodeIfPresent(String.self, forKey: .icon)
//        temperatureMax = try container.decodeIfPresent(Double.self, forKey: .temperatureMax)
//        humidity = try container.decodeIfPresent(Double.self, forKey: .humidity)
//        pressure = try container.decodeIfPresent(Double.self, forKey: .pressure)
//        windSpeed = try container.decodeIfPresent(Double.self, forKey: .windSpeed)
//        time = try container.decodeIfPresent(Double.self, forKey: .time)
//    }
//}


