//
//  CityViewModel.swift
//  Atmosphere
//
//  Created by HT-Mac-06 on 7/21/24.
//

import SwiftUI
import CoreLocation

final class CityViewModel : ObservableObject {
    @Published var weather = WeatherResponse.empty()
    @Published var city: String = "Bareilly" {
        didSet {
            // call get location here
            getLocation()
        }
    }
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
    
    private lazy var dayFormtter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter
    }()
    
    private lazy var timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh a"
        return formatter
    }()
    
    init(){
        getLocation()
        
    }
    var date: String {
        return dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.current.dt)))
    }
    var weatherIcon: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].icon
        }
        return "sun.max.fill"
    }
    var tempareture: String{
        return HelperFunction().getTempFor(temp: weather.current.temp)
    }
    
    var weatherCondition: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].main
        }
        return ""
    }
    
    var windSpeed: String {
        return String(format: "%0.2f", weather.current.wind_speed)
    }
    
    var humidity: String {
        return String(format: "%d%%", weather.current.humidity)
    }
    
    var rainChance: String {
        return String(format: "%0.0f%%", weather.current.dew_point)
    }
    
    func getDayFor(timetamp: Int) ->String {
        return dayFormtter.string(from: Date(timeIntervalSince1970: TimeInterval(timetamp)))
    }
    
    
    private func getLocation(){
        CLGeocoder().geocodeAddressString(city) { (placeMarks, error) in
            if let places = placeMarks, let place = places.first {
                self.getWeather(coordinates: place.location?.coordinate)
            }
            
        }
    }
    
    
    private func getWeather(coordinates: CLLocationCoordinate2D? ){
        if let coordinates = coordinates {
            let urlString = Network.getUrlWithLatLong(lat: coordinates.latitude, lon: coordinates.longitude)
            getWeatherData(city: city, from: urlString)
        }else{
            //unable to get coordinate
            let urlString = Network.getUrlWithLatLong(lat: 0.00, lon: 0.00) // demo cordinates
            getWeatherData(city: city, from: urlString)
            
        }
    }
    
    private func getWeatherData(city: String, from urlString: String){
        NetworkManager<WeatherResponse>.fetchUrl(for: URL(string: urlString)!) { (result) in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.weather = success
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
            
        }
    }
    
    
    
}

class HelperFunction: NSObject {
    
    func getTempFor(temp: Double) -> String {
        return String(format: "%0.2f", temp)
    }
    
    func getTimeFor(time: Double) ->String {
        return String(format: "%0.1f", time)
    }
    
    func getAnimation(icon: String) -> String {
        switch icon {
        case "01d":
            return "dayClearSky"
        default:
            return "nightClearSky"
        }
        
    }
    
    func getWeatherIconFor(icon: String) -> String {
        switch icon {
        case "01d":
            return "sun.fill.max"
        default:
            return "moon.fill"
        }
        
    }
    
    
    
}
