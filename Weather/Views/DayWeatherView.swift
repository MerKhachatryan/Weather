//
//  DayWeatherView.swift
//  Weather
//
//  Created by Meri Khachatryan on 20.05.25.
//

import SwiftUI

struct DayWeatherView: View {
    let weather: Weather
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text(weather.weekday)
                Spacer()
                AsyncImage(url: weather.condition.iconURL) { image in
                    image
                        .resizable()
                        .frame(width: Constants.imageSize, height: Constants.imageSize)
                } placeholder: {
                    ProgressView()
                }
                Spacer()
                Text("Temperature: \(weather.temperatureText)")
            }
            .frame(maxWidth: .infinity)
            Text(weather.condition.text)
            HStack {
                Text("Wind speed: \(weather.windSpeedText)")
                Spacer()
                Text("Humidity: \(weather.humidityText)")
            }
        }
        .frame(maxWidth: .infinity)
    }
}

extension DayWeatherView {
    struct Constants {
        static let imageSize: CGFloat = 40
    }
}
