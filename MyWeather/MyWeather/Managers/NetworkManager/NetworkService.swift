//
//  NetworkService.swift
//  MyWeather
//
//  Created by Valerii on 26.10.2023.
//

import Foundation

// TargetType

protocol TargetType {
    var baseURL: String { get }
    var path: String { get }
    var task: Task { get }
    var headers: [String : String]? { get }
}

// Task

public enum Task {
    case requestPlain
    case requestParameters(parameters: [String : String])
}

// NetworkService

enum NetworkService: TargetType {
    case day(city: String)
    case week(lat: String, lon: String)
    case weather(city: String)
    
    var baseURL: String {
        
        switch self {
            
        case .day, .week:
            return "api.openweathermap.org"
        case .weather:
            return "api.weatherapi.com"
        }
    }
    
    var path: String {
        switch self {
        case .day:
            return "/data/2.5/weather"
        case .week:
            return "/data/2.5/onecall"
        case .weather:
            return "/v1/forecast.json"
        }
    }
    
    var task: Task {
        switch self {
        case .day(let city):
            return .requestParameters(parameters: ["q" : city,
                                                   "appid" : "d06df6ec81b99ec21bf29b8a251e6b08",
                                                   "units" : "metric"])
        case .week(let lat, let lon):
            return .requestParameters(parameters: ["lat" : lat,
                                                   "lon" : lon,
                                                   "exclude" : "current,minutely,hourly,alerts",
                                                   "appid" : "d06df6ec81b99ec21bf29b8a251e6b08",
                                                   "units" : "metric"])
        case .weather(let city):
            return .requestParameters(parameters: ["q" : city,
                                                   "days" : "7",
                                                   "key" : "688726d481e44856acf151347230411",
                                                   "aqi" : "yes"])
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}

// APIError

enum APIError: Error {
    case badURL
    case badResponse(statusCode: Int)
    case url(URLError?)
    case parsing(DecodingError?)
    
    var errorDescription: String {
        switch self {
        case .badURL:
            return "Sorry, something went wrong"
        case .badResponse(let statusCode):
            return "Sorry, the connection to our server failed. Status code \(statusCode)"
        case .url(let error):
            return error?.localizedDescription ?? "Something went wrong"
        case .parsing(let error):
            return "JSON parsing problem: " + (error?.localizedDescription ?? "Error")
        }
    }
}
