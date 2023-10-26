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

    func fetchWeather(lat: String, lon: String, completion: @escaping (Result<Forecast, APIError>) -> ()) {
        networkManager.fetchData(Forecast.self, servise: .week(lat: lat, lon: lon), completion: completion)
    }
    
//    func fetchTeams(leagueID: String, completion: @escaping (Result<Match, APIError>) -> ()) {
//        networkManager.fetchData(Match.self, servise: .teams(leagueID: leagueID), completion: completion)
//    }
}
