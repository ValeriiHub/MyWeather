//
//  DayForecast.swift
//  MyWeather
//
//  Created by Валерий Д on 04.11.2023.
//

import Foundation

protocol DayForecastVM {
    var temperature: Double { get }
    var minTemp: Double { get }
    var maxTemp: Double { get }
    var date: String { get }
}


// MARK: - DayForecast
struct DayForecast: Codable {
    let weather: [Weather]?
//    let base: String
    let main: Main
//    let visibility: Int
//    let wind: Wind
//    let rain: Rain
//    let clouds: Clouds
//    let dt: Int
//    let sys: Sys
//    let timezone, id: Int
//    let name: String
//    let cod: Int
}

//// MARK: - Clouds
//struct Clouds: Codable {
//    let all: Int
//}

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

//// MARK: - Rain
//struct Rain: Codable {
//    let the1H: Double
//
//    enum CodingKeys: String, CodingKey {
//        case the1H = "1h"
//    }
//}
//
//// MARK: - Sys
//struct Sys: Codable {
//    let type, id: Int
//    let country: String
//    let sunrise, sunset: Int
//}

//// MARK: - Wind
//struct Wind: Codable {
//    let speed: Double
//    let deg: Int
//    let gust: Double
//}
