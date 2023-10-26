//
//  Forecast.swift
//  MyWeather
//
//  Created by Valerii on 26.10.2023.
//

import Foundation

protocol DailyForecastVM {
    var temperature: Double { get }
    var minTemp: Double { get }
    var maxTemp: Double { get }
    var date: String { get }
}

// MARK: - Weater
struct Forecast: Codable {
    let daily: [DailyForecast]?
}

// MARK: - Daily
struct DailyForecast: Codable {
    let dt: Double?
    let temp: Temp?
    let humidity: Int?
    let weather: [Weather]?
    let clouds: Int?
    let pop: Double?
}

// MARK: - Temp
struct Temp: Codable {
    let day, min, max, night: Double?
    let eve, morn: Double?
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int?
    let main, description, icon: String?
}

extension DailyForecast: DailyForecastVM {
    var temperature: Double { self.temp?.day ?? 0 }
    var minTemp: Double { self.temp?.min ?? 0 }
    var maxTemp: Double { self.temp?.max ?? 0}
    var date: String { self.dt?.convertDoubleToString(format: .dayDateMohth) ?? "-"}
}
