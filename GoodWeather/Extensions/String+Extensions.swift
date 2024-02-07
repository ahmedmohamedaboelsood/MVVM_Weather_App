//
//  String+Extensions.swift
//  GoodWeather
//
//  Created by 2B on 02/01/2024.
//

import Foundation

extension String {
    
    func escaped() -> String{
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
    
}
