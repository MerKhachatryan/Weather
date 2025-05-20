//
//  WeatherListView.swift
//  Weather
//
//  Created by Meri Khachatryan on 19.05.25.
//

import SwiftUI

struct WeatherListView: View {
    @StateObject private var weatherViewModel = WeatherViewModel()
    
    var body: some View {
        List(weatherViewModel.weathers) { weather in
            DayWeatherView(weather: weather)
        }
        .task {
            await weatherViewModel.fetchWeather()
        }
    }
}
