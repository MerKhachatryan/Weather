//
//  Weather.swift
//  Weather
//
//  Created by Meri Khachatryan on 20.05.25.
//

import Foundation

struct Weather: Decodable, Identifiable {
    let id: UUID = UUID()
    let date: Date
    let condition: Condition
    let temperature: Int
    let windSpeed: Int
    let humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case day
        case condition
        case date = "date_epoch"
        case temperature = "avgtemp_c"
        case windSpeed = "maxwind_kph"
        case humidity = "avghumidity"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let day = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .day)
        date = try container.decode(Date.self, forKey: .date)
        condition = try day.decode(Condition.self, forKey: .condition)
        temperature = Int((try day.decode(Double.self, forKey: .temperature)).rounded())
        windSpeed = Int((try day.decode(Double.self, forKey: .windSpeed)).rounded())
        humidity = try day.decode(Int.self, forKey: .humidity)
    }
}
