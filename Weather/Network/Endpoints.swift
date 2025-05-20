//
//  Endpoints.swift
//  Weather
//
//  Created by Meri Khachatryan on 19.05.25.
//

struct Endpoints {
    
    static let baseUrl = "https://api.weatherapi.com/v1/forecast.json?key=5e775ca3193a4a6e989163249252005"

    static var locationWeather: String {
        return baseUrl + "&q=%@&days=5"
    }
}
