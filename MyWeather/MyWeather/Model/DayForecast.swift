//
//  DayForecast.swift
//  MyWeather
//
//  Created by Валерий Д on 04.11.2023.
//

import Foundation

protocol DayForecastVM {
    var cityName: String { get }
    var temperature: Int { get }
    var minTemp: Int { get }
    var maxTemp: Int { get }
    var date: String { get }
    var description: String { get }
    var feelsLike: Int { get }
    var humidity: Int { get }
    var pressure: Int { get }
    var sunrise: Double { get }
    var sunset: Double { get }
    var cloudiness: Int { get }
    
    var windSpeed: Double { get }
    var windDirection: Double { get }
    var windGust: Double { get }
}

// MARK: - DayForecast
struct DayForecast: Codable {
    let weather: [Weather]?
    let main: Main?
    let wind: Wind?
    let clouds: Clouds
    let dt: Double?
    let sys: Sys
    let name: String?
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int?
}

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double?
    let pressure, humidity: Int?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - Sys
struct Sys: Codable {
    let sunrise, sunset: Double?
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double?
    let deg: Double?
    let gust: Double?
}

extension DayForecast: DayForecastVM {
    var cityName: String { self.name ?? "-" }
    var temperature: Int { Int(self.main?.temp ?? 0)}
    var minTemp: Int {  Int(self.main?.tempMin ?? 0)}
    var maxTemp: Int { Int(self.main?.tempMax ?? 0) }
    var date: String { self.dt?.convertDoubleToString(format: .dayDateMohth) ?? "-"}
    var description: String { self.weather?.first?.main ?? "-" }
    var feelsLike: Int { Int(self.main?.feelsLike ?? 0) }
    var humidity: Int { self.main?.humidity ?? 0 }
    var pressure: Int { self.main?.pressure ?? 0 }
    var sunrise: Double { self.sys.sunrise ?? 0 }
    var sunset: Double { self.sys.sunset ?? 0 }
    var cloudiness: Int { self.clouds.all ?? 0 }
    
    var windSpeed: Double { self.wind?.speed ?? 0}
    var windDirection: Double { self.wind?.deg ?? 0 }
    var windGust: Double { self.wind?.gust ?? 0}
}
