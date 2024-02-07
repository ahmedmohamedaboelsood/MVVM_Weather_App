//
//  Constants.swift
//  GoodWeather
//
//  Created by 2B on 01/01/2024.
//

import Foundation

//MARK: - Api URLs

struct Constants {
    
    struct Urls{
        
        static private var baseDomain = "https://api.openweathermap.org/data/2.5/"
        static private var ApiKey = "&appid=6c2eee34075a3140f34b803f5c6c2e14"
        
        static func getCityWeather(city:String) -> URL?{
            guard let selectedTempUnit = Defaults.selectedUnit?.rawValue else{
                return URL(string: "")
            }
            return URL(string:  baseDomain + EndPoints.getCityWeather.rawValue + "?q=" + city.escaped() + ConstantParameters.unit.rawValue + selectedTempUnit + ApiKey)
        }
        
        private enum EndPoints : String {
            case getCityWeather = "weather"
        }
        
        private enum ConstantParameters : String {
            case unit = "&units="
        }
    }
}
