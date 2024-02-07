//
//  CustomProtocools.swift
//  GoodWeather
//
//  Created by 2B on 02/01/2024.
//

import Foundation

protocol AddNewCityDelegate{
    func addCityDidSaved(vm:WeatherViewModel)
}

protocol SettingsDone{
    func settingsChanged(unit : Unit?)
}
