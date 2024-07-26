//
//  WeatherResponse.swift
//  Atmosphere
//
//  Created by HT-Mac-06 on 7/21/24.
//

import Foundation

struct WeatherResponse : Codable {
    var current: WeatherSubclass
    var hourly: [Weather]
    var daily: [DailyWeather]
    
    static func empty() -> WeatherResponse {
        return WeatherResponse(current: WeatherSubclass(), hourly: [Weather](repeating: Weather(), count: 23), daily: [DailyWeather](repeating: DailyWeather(), count: 8))
    }
}
