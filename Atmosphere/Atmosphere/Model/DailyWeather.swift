//
//  DailyWeather.swift
//  Atmosphere
//
//  Created by HT-Mac-06 on 7/21/24.
//

import Foundation

struct DailyWeather: Codable, Identifiable {
    var dt: Int
    var temp: Temperature
    var weather: [WeatherDetails]
    
    enum CodingKeys: CodingKey {
        case dt
        case temp
        case weather
    }
    init()  {
        dt = 0
        temp = Temperature(day: 0.0, max: 0.0, min: 0.0, night: 0.0, eve: 0.0, morn: 0.0)
        weather = [WeatherDetails(main: "", description: "", icon: "")]
    }
    
}
extension DailyWeather {
    var id: UUID{
        return UUID()
    }
}
