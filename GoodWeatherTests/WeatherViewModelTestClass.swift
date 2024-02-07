//
//  WeatherViewModelTestClass.swift
//  GoodWeatherTests
//
//  Created by 2B on 04/01/2024.
//

import XCTest
@testable import GoodWeather

final class WeatherViewModelTestClass: XCTestCase {
    
    var weatherVM : WeatherListViewModel!
    
    override func setUp() {
        super.setUp()
        self.weatherVM = WeatherListViewModel()
        
        weatherVM.addNewWeather(WeatherViewModel(weather: WeatherResponce(name: "Cairo", main: Weather(temp: 32, humidity: 50))))
        weatherVM.addNewWeather(WeatherViewModel(weather: WeatherResponce(name: "Posten", main: Weather(temp: 72, humidity: 0))))
    }
    
    func test_convert_unit_to_celsius_successfully(){
        let celsiusTempratures = [0,22.2222]
        weatherVM.updateTemp(unit: .celsius)
        
        for (index,vm) in weatherVM.weatherList.enumerated(){
            XCTAssertEqual(round(vm.temp), round(celsiusTempratures[index]))
        }
    }
}
