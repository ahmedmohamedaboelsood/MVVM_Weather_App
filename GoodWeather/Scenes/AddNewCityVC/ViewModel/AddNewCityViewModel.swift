//
//  AddNewCityViewModel.swift
//  GoodWeather
//
//  Created by 2B on 01/01/2024.
//

import Foundation

class AddNewCityViewModel {
    
    func getNewCityTemprature(city : String? , completion: @escaping (WeatherViewModel)->Void){
        if let city = city {
            let url = Constants.Urls.getCityWeather(city: city)
            let resources = Resource<WeatherResponce>(url: url!) { data in
                return try? JSONDecoder().decode(WeatherResponce.self, from: data)
            }
            WebService().load(resource: resources) {[weak self] data in
                guard let self = self else {return}
                if let weatherData = data {
                    let viewModel = WeatherViewModel(weather:weatherData)
                    completion(viewModel)
                }
            }
        }
    }
}
