//
//  MainViewModel.swift
//  MyWeather
//
//  Created by Valerii on 18.10.2023.
//

import Foundation

final class MainViewModel: ObservableObject {
    
    //MARK: - @Property Wrappers
    
    @Published var searchCity = "Kyiv"
    @Published var dayForecaset: DayForecastVM?
    @Published var dataState: DataState = .loadedData
    
//    @Published var forecaset: Forecast?
    
    //MARK: - Properties
    
    let networkManager = AppNetworkManager()
    
    //MARK: - Init
    
    
    
    //MARK: - Functions
    
    func fetchWeather() {
        self.dataState = .loadingData
        
        networkManager.fetchDayWeather(city: searchCity) { [weak self] result in
            guard let self else { return }

            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.dayForecaset = data
                    self.dataState = .loadedData
                case .failure(let error):
                    print(error.errorDescription)
                    self.dataState = .errorData
                }
            }
        }
        
//        networkManager.fetchWeather(city: searchCity) { [weak self] result in
//            guard let self else { return }
//            
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let data):
//                    self.forecaset = data
//                    self.dataState = .loadedData
//                case .failure(let error):
//                    print(error.errorDescription)
//                    self.dataState = .errorData
//                }
//            }
//        }
    }
}
