//
//  WeatherViewModel.swift
//  Weatherly
//
//  Created by Emir haktan Ozturk on 13.04.2019.
//  Copyright © 2019 emirhaktan. All rights reserved.
//

import Foundation

struct WeatherViewModel {
    let timezone : String
   
    
    init(weather:Weather) {
        if let timeZone = weather.timezone{
            self.timezone = timeZone}else{self.timezone = ""}

    }
}

struct DailyDataViewModel {
        let summary : String
        let temperatureMax : Double
        let humidity : Double
        let pressure : Double
        let windSpeed : Double
        let time : Double
    
        let summaryText : String
        let temperatureMaxText : String
        let humidityText : String
        let pressureText : String
        let windSpeedText : String
        let timeText : String
    
    init(dailyData:DailyData) {
                if let sum = dailyData.summary{
                self.summary = sum
                }else{self.summary = ""}
                if let temp = dailyData.temperatureMax{
                self.temperatureMax = temp
                }else{self.temperatureMax = 0}
                            if let hum = dailyData.humidity{
                                self.humidity = hum
                            }else{self.humidity = 0}
        
                            if let pres = dailyData.pressure{
                                self.pressure = pres
                            }else{self.pressure = 0}
        
                            if let windS = dailyData.windSpeed{
                                self.windSpeed = windS
                            }else{self.windSpeed = 0}
        
                            if let time = dailyData.time{
                                self.time = time
                            }else{self.time = 0}
        
                self.summaryText = self.summary
                        self.temperatureMaxText = String(describing: Int(self.temperatureMax)) + " °C"
                        self.humidityText = String(describing: Int(self.humidity * 100)) + " RH"
                        self.pressureText = String(describing: Int(self.pressure)) + " P"
                        self.windSpeedText = String(describing: Int(self.windSpeed)) + " wS"
                        let timeForData = self.time
                        let date = Date(timeIntervalSince1970: timeForData)
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateStyle = DateFormatter.Style.medium
                        dateFormatter.timeZone = TimeZone.current
                        let dateOfWeather = dateFormatter.string(from: date)
                        self.timeText = dateOfWeather
    }
}



//struct WeatherViewModel {
//    let timezone : String
//
//    init(weather:Weather) {
//        self.timezone = weather.timezone
//    }
//}
//
//struct DataViewModel {
//    let summary : String
//    let temperatureMax : Double
//    let humidity : Double
//    let pressure : Double
//    let windSpeed : Double
//    let time : Double
//
//    let summaryText : String
//    let temperatureMaxText : String
//    let humidityText : String
//    let pressureText : String
//    let windSpeedText : String
//    let timeText : String
//
//    init(data:Data) {
//        if let sum = data.summary{
//            self.summary = sum
//        }else{self.summary = ""}
//
//        if let temp = data.temperatureMax{
//            self.temperatureMax = temp
//        }else{self.temperatureMax = 0}
//
//        if let hum = data.humidity{
//            self.humidity = hum
//        }else{self.humidity = 0}
//
//        if let pres = data.pressure{
//            self.pressure = pres
//        }else{self.pressure = 0}
//
//        if let windS = data.windSpeed{
//            self.windSpeed = windS
//        }else{self.windSpeed = 0}
//
//        if let time = data.time{
//            self.time = time
//        }else{self.time = 0}
//
//        self.summaryText = self.summary
//        self.temperatureMaxText = String(describing: Int(self.temperatureMax)) + " °C"
//        self.humidityText = String(describing: Int(self.humidity * 100)) + " RH"
//        self.pressureText = String(describing: Int(self.pressure)) + " P"
//        self.windSpeedText = String(describing: Int(self.windSpeed)) + " wS"
//        let timeForData = self.time
//        let date = Date(timeIntervalSince1970: timeForData)
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = DateFormatter.Style.medium
//        dateFormatter.timeZone = TimeZone.current
//        let dateOfWeather = dateFormatter.string(from: date)
//        self.timeText = dateOfWeather
//    }
//}

