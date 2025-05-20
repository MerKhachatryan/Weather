//
//  WeatherForecast.swift
//  Weather
//
//  Created by Meri Khachatryan on 20.05.25.
//

struct WeatherForecast: Decodable {
    let list: [Weather]
    
    enum CodingKeys: String, CodingKey {
        case forecast
        case forecastday
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let response = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .forecast)
        list = try response.decode([Weather].self, forKey: .forecastday)
    }
}
