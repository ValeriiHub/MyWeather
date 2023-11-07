//
//  WeekForecastViewModel.swift
//  MyWeather
//
//  Created by Valerii on 26.10.2023.
//

import Foundation

final class WeekForecastViewModel: ObservableObject {
    
    //MARK: - @Property Wrappers
    
    @Published var weekForecaset: [WeekForecast] = []
    @Published var searchCity = ""
    @Published var latitude = "50.474822734351555"
    @Published var longitude = "30.39981187344749"
    @Published var dataState: DataState = .loadedData
    
    //MARK: - Properties
    
    let networkManager = AppNetworkManager()
    
    //MARK: - Init
    
    
    
    //MARK: - Functions
    
    func fetchWeather() {
        self.dataState = .loadingData
        
        networkManager.fetchWeekWeather(lat: latitude, lon: longitude) { [weak self] result in
            guard let self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.weekForecaset = data.daily ?? []
                    self.dataState = .loadedData
                case .failure(let error):
                    print(error.errorDescription)
                    self.dataState = .errorData
                }
            }
        }
    }
}
