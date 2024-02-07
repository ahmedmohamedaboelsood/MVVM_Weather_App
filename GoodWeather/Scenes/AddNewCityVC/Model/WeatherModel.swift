//
//  WeatherModel.swift
//  GoodWeather
//
//  Created by 2B on 01/01/2024.
//

import Foundation

struct WeatherResponce : Decodable {
    let name : String
    let main : Weather
}

struct Weather : Decodable {
    let temp : Double
    let humidity : Double
}
