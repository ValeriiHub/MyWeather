//
//  NetworkService.swift
//  MyWeather
//
//  Created by Valerii on 26.10.2023.
//

import Foundation

protocol TargetType {
    var baseURL: String { get }
    var path: String { get }
    var task: Task { get }
    var headers: [String : String]? { get }
}

public enum Task {
    case requestPlain
    case requestParameters(parameters: [String : String])
}

enum NetworkService: TargetType {
    case day(city: String)
    case week(lat: String, lon: String)
    
    var baseURL: String {
        return "api.openweathermap.org"
    }
    
    var path: String {
        switch self {
        case .day:
            return "/data/2.5/weather"
        case .week:
            return "/data/2.5/onecall"
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
                                                   "appid" : "d06df6ec81b99ec21bf29b8a251e6b08",
                                                   "exclude" : "current,minutely,hourly,alerts",
                                                   "units" : "metric"])
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}

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
