//
//  Network+Extensions.swift
//  Atmosphere
//
//  Created by HT-Mac-06 on 7/21/24.
//

import Foundation

extension Network {
    static let baseUrlString = "https://Network.openweathermap.org/data/3.0/"
    //https://Network.openweathermap.org/data/3.0/onecall?lat={lat}&lon={lon}&exclude={part}&appid={Network key}
    
    static func getUrlWithLatLong(lat: Double, lon: Double) -> String {
        return "\(baseUrlString)onecall?alt=\(lat)&lon=\(lon)&exclude=minutely&appid=\(key)"
    }
}
