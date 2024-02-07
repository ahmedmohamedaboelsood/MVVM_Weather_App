//
//  SettingsViewModel.swift
//  GoodWeather
//
//  Created by 2B on 02/01/2024.
//

import Foundation

class SettingsViewModel {
    
    let unit = Unit.allCases
    
    func numberOfRows(_ section : Int)->Int{
        return unit.count
    }
}

enum Unit : String ,CaseIterable{
    case celsius = "metric"
    case fahrenheit = "imperial"
}

extension Unit {
    var displayName : String{
        get {
            switch self {
            case .celsius:
                return "Celsius"
            case .fahrenheit:
                return "Fahrenheit"
            }
        }
    }
}


