//
//  SettingsTestClass.swift
//  GoodWeatherTests
//
//  Created by 2B on 04/01/2024.
//

import XCTest
@testable import GoodWeather
final class SettingsTestClass: XCTestCase {

    func test_default_value_for_weather_unit(){
        XCTAssertEqual(Defaults.selectedUnit, .fahrenheit)
    }
    
    func test_able_to_return_correct_name_for_selected_unit(){
        XCTAssertEqual(Defaults.selectedUnit?.displayName, "Fahrenheit")
    }
    
    func test_able_to_save_new_selected_unit(){
        Defaults.selectedUnit = .celsius
        XCTAssertNotNil(Defaults.selectedUnit)
    }

    override class func tearDown() {
        Defaults.selectedUnit = nil
    }
    
}
