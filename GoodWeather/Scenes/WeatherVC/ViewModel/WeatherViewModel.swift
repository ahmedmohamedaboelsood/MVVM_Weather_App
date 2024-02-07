//
//  WeatherViewModel.swift
//  GoodWeather
//
//  Created by 2B on 02/01/2024.
//

import Foundation

class WeatherListViewModel{
    
    var weatherList = [WeatherViewModel]()
    
    func addNewWeather(_ vm : WeatherViewModel){
        weatherList.append(vm)
    }
    
    func numberOfRows(_ section : Int) -> Int{
        return weatherList.count
    }
    
    func modelOf(_ index : Int) -> WeatherViewModel{
        return weatherList[index]
    }
    
    func updateTemp(unit: Unit){
        switch unit {
        case .celsius:
            tempToCelsius()
        case .fahrenheit:
            tempToFahrenheit()
        }
    }
    
    private func tempToCelsius(){
        weatherList = weatherList.map({ viewModel in
            let weatherVM = viewModel
            weatherVM.temp = (viewModel.temp - 32) * 5/9
            return weatherVM
        })
    }
    
    private func tempToFahrenheit(){
        weatherList = weatherList.map({ viewModel in
            let weatherVM = viewModel
            weatherVM.temp = (viewModel.temp * 9/5) + 32
            return weatherVM
        })
    }
}


class WeatherViewModel {
    
    var weatherData : WeatherResponce!
    var temp : Double!
    
    init(weather : WeatherResponce){
        weatherData = weather
        temp = weather.main.temp
    }
    
    var city : String {
        return weatherData.name
    }
    
    
}
