//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Meri Khachatryan on 19.05.25.
//

import SwiftUI

class WeatherViewModel: ObservableObject {
    let location = "moscow"
    var networkManager = NetworkManager()
    @Published var weathers: [Weather] = []
    
    func fetchWeather() async {
        let urlString = String(format: Endpoints.locationWeather, location)
        guard let url = URL(string: urlString) else {
            return
        }
        do {
            let weatherForecast = try await networkManager.getData(from: url) as WeatherForecast
            weathers = weatherForecast.list
        } catch {
            print(error.localizedDescription)
        }
    }
}
