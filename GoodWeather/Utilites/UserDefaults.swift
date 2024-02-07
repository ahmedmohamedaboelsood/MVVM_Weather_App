//
//  UserDefaults.swift
//  GoodWeather
//
//  Created by 2B on 02/01/2024.
//

import Foundation

struct Defaults {
    
    private enum Keys : String{
        case unit = "unit"
    }
    
    static var selectedUnit : Unit? {
        get {
            var unitValue = ""
            if let value = UserDefaults.standard.string(forKey: Keys.unit.rawValue){
                unitValue = value
            }
            return Unit(rawValue: unitValue) ?? .none
        }
        
        set{
            UserDefaults.standard.set(newValue?.rawValue, forKey: Keys.unit.rawValue)
        }
    }
}
