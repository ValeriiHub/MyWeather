//
//  AppNetworkManager.swift
//  MyWeather
//
//  Created by Valerii on 26.10.2023.
//

import Foundation

class AppNetworkManager {
    
    private let networkManager = NetworkManager<NetworkService>()

    //MARK: - Functions

    func fetchWeekWeather(lat: String, lon: String, completion: @escaping (Result<WeatherForecast, APIError>) -> ()) {
        networkManager.fetchData(WeatherForecast.self, servise: .week(lat: lat, lon: lon), completion: completion)
    }
    
    func fetchDayWeather(city: String, completion: @escaping (Result<DayForecast, APIError>) -> ()) {
        networkManager.fetchData(DayForecast.self, servise: .day(city: city), completion: completion)
    }
    
//    func fetchWeather(city: String, completion: @escaping (Result<Forecast, APIError>) -> ()) {
//        networkManager.fetchData(Forecast.self, servise: .weather(city: city), completion: completion)
//    }
}
