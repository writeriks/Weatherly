//
//  WeatherlyTests.swift
//  WeatherlyTests
//
//  Created by Emir haktan Ozturk on 6.04.2019.
//  Copyright © 2019 emirhaktan. All rights reserved.
//

import XCTest
@testable import Weatherly

class WeatherlyTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
//    let summary : String
//    let icon : String
//    let temperatureMax : Double
//    let humidity : Double
//    let pressure : Double
//    let windSpeed : Double
//    let time: Double
    
    func testWeatherViewModel(){
        let weatherData = Data(summary:"hello" , icon:"hi" , temperatureMax:16.0 , humidity:0.56 , pressure:1056.0 , windSpeed:14.0 , time:1555958484)
        let dataviewModel = DataViewModel(data: weatherData)
        
        XCTAssertEqual(weatherData.temperatureMax, Double(dataviewModel.temperatureMax))
        
    }
    
    
}
