//
//  WebService.swift
//  GoodWeather
//
//  Created by 2B on 01/01/2024.
//

import Foundation

struct Resource<T>{
    let url : URL
    let parce : (Data) -> T?
}

final class WebService{
    
    func load<T>(resource: Resource<T>,complition: @escaping (T?)->()){
        URLSession.shared.dataTask(with: resource.url) { data, responce, error in
            print(responce?.url)
            print(error?.localizedDescription)
            
            if let data = data {
                complition(resource.parce(data))
            }else{
                complition(nil)
            }
        }.resume()
    }
    
    
}
