//
//  Double + Extensions.swift
//  GoodWeather
//
//  Created by 2B on 02/01/2024.
//

import Foundation

extension Double {
    
    func formateToDegree()->String{
        return String(format: "%.0f\u{00B0}", self)
    }
    
}
