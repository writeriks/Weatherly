//
//  Weather.swift
//  Weatherly
//
//  Created by Emir haktan Ozturk on 8.04.2019.
//  Copyright © 2019 emirhaktan. All rights reserved.
//

import Foundation

struct Weather: Decodable {
    let timezone : String
    let daily : Daily
}

struct Daily: Decodable {
    let data : [Data]
}

struct Data: Decodable {
    let summary : String
    let icon : String
    let temperatureMax : Double
    let humidity : Double
    let pressure : Double
    let windSpeed : Double
    let time: Double
}
