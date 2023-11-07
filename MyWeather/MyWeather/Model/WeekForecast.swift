//
//  Forecast.swift
//  MyWeather
//
//  Created by Valerii on 26.10.2023.
//

import Foundation

protocol WeekForecastVM {
    var temperature: Double { get }
    var minTemp: Double { get }
    var maxTemp: Double { get }
    var date: String { get }
}

// MARK: - Weater
struct WeatherForecast: Codable {
    let daily: [WeekForecast]?
}

// MARK: - Daily
struct WeekForecast: Codable {
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

extension WeekForecast: WeekForecastVM {
    var temperature: Double { self.temp?.day ?? 0 }
    var minTemp: Double { self.temp?.min ?? 0 }
    var maxTemp: Double { self.temp?.max ?? 0}
    var date: String { self.dt?.convertDoubleToString(format: .dayDateMohth) ?? "-"}
}
