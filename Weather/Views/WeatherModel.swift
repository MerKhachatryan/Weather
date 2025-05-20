//
//  WeatherModel.swift
//  Weather
//
//  Created by Meri Khachatryan on 19.05.25.
//

import Foundation

extension Weather {
    var temperatureText: String {
        "\(temperature)°C"
    }

    var windSpeedText: String {
        "\(windSpeed) kph"
    }

    var humidityText: String {
        "\(humidity)%"
    }

    var weekday: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: date)
    }
}
