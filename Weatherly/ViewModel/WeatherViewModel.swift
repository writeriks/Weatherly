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
        self.timezone = weather.timezone
    }
}

struct DataViewModel {
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
    
    init(data:Data) {
//        self.summary = data.summary
//        self.temperatureMax = String(describing: Int(data.temperatureMax)) + " °C"
//        self.humidity = String(describing: Int(data.humidity * 100)) + " RH"
//        self.pressure = String(describing: Int(data.pressure)) + " P"
//        self.windSpeed = String(describing: Int(data.windSpeed)) + " wS"
//        let timeForData = data.time
//        let date = Date(timeIntervalSince1970: timeForData)
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = DateFormatter.Style.medium
//        dateFormatter.timeZone = TimeZone.current
//        let dateOfWeather = dateFormatter.string(from: date)
//        self.time = dateOfWeather
        
        self.summary = data.summary
        self.temperatureMax = data.temperatureMax
        self.humidity = data.humidity
        self.pressure = data.pressure
        self.windSpeed = data.windSpeed
        self.time = data.time
        
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
