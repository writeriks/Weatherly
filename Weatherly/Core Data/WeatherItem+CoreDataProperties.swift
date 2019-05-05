//
//  WeatherItem+CoreDataProperties.swift
//  Weatherly
//
//  Created by Emir haktan Ozturk on 5.05.2019.
//  Copyright © 2019 emirhaktan. All rights reserved.
//
//

import Foundation
import CoreData


extension WeatherItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeatherItem> {
        return NSFetchRequest<WeatherItem>(entityName: "WeatherItem")
    }

    @NSManaged public var timezone: String?
    @NSManaged public var dailyDataItem: NSSet?

}

// MARK: Generated accessors for dailyDataItem
extension WeatherItem {

    @objc(addDailyDataItemObject:)
    @NSManaged public func addToDailyDataItem(_ value: DailyDataItem)

    @objc(removeDailyDataItemObject:)
    @NSManaged public func removeFromDailyDataItem(_ value: DailyDataItem)

    @objc(addDailyDataItem:)
    @NSManaged public func addToDailyDataItem(_ values: NSSet)

    @objc(removeDailyDataItem:)
    @NSManaged public func removeFromDailyDataItem(_ values: NSSet)

}
