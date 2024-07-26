//
//  Weather.swift
//  Atmosphere
//
//  Created by HT-Mac-06 on 7/21/24.
//



import Foundation

class Weather: Codable, Identifiable {
    var dt: Int
    var temp: Double
    var feel_like: Double
    var pressure: Double
    var humidity: Int
    var dew_point: Double
    var uvi: Double
    var clouds: Int
    var visibility:Int
    var wind_speed:Double
    var wind_deg:Int
    var wind_gust:Double
    var weather: [WeatherDetails]
    
    enum CodingKey: String {
        case dt
        case temp
        case feel_like
        case pressure
        case humidity
        case dew_point
        case uvi
        case clouds
        case visibilit
        case wind_spee
        case wind_de
        case wind_gust
        case weather
    }
    
    init(){
        dt = 0
        temp = 0.0
        feel_like = 0.0
        pressure = 0.0
        humidity = 0
        dew_point = 0.0
        uvi = 0.0
        clouds = 0
        visibility = 0
        wind_speed = 0.0
        wind_deg = 0
        wind_gust = 0.0
        weather = [WeatherDetails(main: "", description: "", icon: "")]
    }
}
extension Weather {
    var id: UUID{
        return UUID()
    }
}

    class WeatherSubclass: Weather {
        var sunset: Int
        var sunrise: Int

        enum CodingKeys: String {
            case sunset
            case sunrise
        }

        override init() {

            self.sunset = 0
            self.sunrise = 0
            super.init()
            self.dt = dt
            self.temp = temp
            self.feel_like = feel_like
            self.pressure = pressure
            self.humidity = humidity
            self.dew_point = dew_point
            self.uvi = uvi
            self.clouds = clouds
            self.visibility = visibility
            self.wind_speed = wind_speed
            self.wind_deg = wind_deg
            self.wind_gust = wind_gust
            self.weather = weather
        }
        
        required init(from decoder: Decoder) throws {
            fatalError("init(from:) has not been implemented")
        }
        
    }
