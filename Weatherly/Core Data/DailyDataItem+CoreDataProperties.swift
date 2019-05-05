//
//  DailyDataItem+CoreDataProperties.swift
//  Weatherly
//
//  Created by Emir haktan Ozturk on 5.05.2019.
//  Copyright © 2019 emirhaktan. All rights reserved.
//
//

import Foundation
import CoreData


extension DailyDataItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DailyDataItem> {
        return NSFetchRequest<DailyDataItem>(entityName: "DailyDataItem")
    }

    @NSManaged public var summary: String?
    @NSManaged public var temperatureMax: Double
    @NSManaged public var humidity: Double
    @NSManaged public var pressure: Double
    @NSManaged public var windSpeed: Double
    @NSManaged public var time: Double
    @NSManaged public var weatherItem: WeatherItem?

}
