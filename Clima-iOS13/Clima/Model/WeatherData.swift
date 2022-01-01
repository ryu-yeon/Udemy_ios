//
//  WeatherData.swift
//  Clima
//
//  Created by 유연탁 on 2021/12/30.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
    
}

struct Weather: Codable {
    let id: Int
    let description: String
}
