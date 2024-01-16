//
//  MainView.swift
//  MyWeather
//
//  Created by Valerii on 08.10.2023.
//

import SwiftUI

struct MainView: View {
    
    //MARK: - @Property Wrappers
    
    @StateObject private var mainVM = MainViewModel()
    
    @State private var isSettingsShow = false
    
    //MARK: - Properties
    
    
    
    //MARK: - Body
    
    var body: some View {
        ZStack(alignment: .top) {
            // BACKGROUND
            Color.backgroundColor
                .ignoresSafeArea()
                .onAppear {
                    mainVM.fetchWeather()
                }
            
            // MAIN CONTENT
            VStack(spacing: 0) {
                // HEADER
                header
                
                // SEARCH
                search
                
                ScrollView(showsIndicators: false) {
                    // WEATHER
                    weather
                    
                    // STATISTICS
                    statistics
                    
                    // WIND
                    wind
                }
            }
        }
    }
}

//MARK: - Preview

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

//MARK: - Extension

extension MainView {
    //MARK: VIEW COMPONENTS
    
    // HEADER
    private var header: some View {
        HStack(spacing: 8) {
            // IMAGE
            Image(systemName: "location.circle")
                .font(.system(size: 20))
            
            VStack(spacing: 4) {
                // CITY
                Text(mainVM.dayForecaset?.cityName ?? "-")
                    .font(.system(size: 22, weight: .bold))
                
                // DATE
                Text(mainVM.dayForecaset?.date ?? "-")
                    .font(.system(size: 12))
            }
            .foregroundColor(.selectColor)
            .padding(.trailing, 28)
        }
        .frame(height: 48)
        .padding(.horizontal, 20)
    }
    
    // SEARCH
    private var search: some View {
        SearchView(text: $mainVM.searchCity)
            .padding(.top, 12)
            .padding(.horizontal, 20)
            .shadow(color: .black.opacity(0.1), radius: 10)
    }
    
    // WEATHER
    private var weather: some View {
        HStack(spacing: 28) {
            // WEATHER IMAGE
            VStack {
                Image("sunIcon")
                    .resizable()
                    .frame(width: 180, height: 180)
                
                Text(String(mainVM.dayForecaset?.description ?? "-"))
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.selectColor)
            }
            
            // WEATHER DATA
            VStack(alignment: .leading, spacing: 8) {
                Text(String(mainVM.dayForecaset?.temperature ?? 0) + "°")
                    .font(.system(size: 54, weight: .bold))
                    .foregroundColor(.white)
                
                Group {
                    Text("Feels like \(mainVM.dayForecaset?.temperature ?? 0)°")
                    
                    Label(String(mainVM.dayForecaset?.windSpeed ?? 0) + " m/sec", systemImage: "wind")
                    
                    Label("\(mainVM.dayForecaset?.humidity ?? 0)%", systemImage: "drop")
                }
                .font(.system(size: 20))
                .foregroundColor(.selectColor)
            }
        }
        .padding(.top, 12)
        .padding(.horizontal, 20)
    }
    
    // STATISTICS
    private var statistics: some View {
        VStack(spacing: 12) {
            HStack {
                Image(systemName: "cloud")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold))
                
                Text("Air Quality")
                    .foregroundColor(.selectColor)
                    .font(.system(size: 24, weight: .semibold))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                AirQualityView(image: "thermometer.low", title: "Max",
                               value: String(mainVM.dayForecaset?.maxTemp ?? 0) + "°")
                
                AirQualityView(image: "thermometer.high", title: "Min",
                               value: String(mainVM.dayForecaset?.minTemp ?? 0) + "°")
            }
            
            HStack {
                AirQualityView(image: "cloud.sun.rain", title: "Pressure",
                               value: String(mainVM.dayForecaset?.pressure ?? 0) + " hPa")
                
                AirQualityView(image: "cloud", title: "Cloudiness",
                               value: String(mainVM.dayForecaset?.cloudiness ?? 0) + " %")
            }
            
            HStack {
                AirQualityView(image: "sunrise.fill", title: "Sunrise",
                               value: (mainVM.dayForecaset?.sunrise ?? 0).convertDoubleToString(format: .time))
                
                AirQualityView(image: "sunset.fill", title: "Sunset",
                               value: (mainVM.dayForecaset?.sunset ?? 0).convertDoubleToString(format: .time))
            }
        }
        .padding(.horizontal, 28)
        .padding(.vertical, 20)
        .frame(maxWidth: .infinity)
        .background(Color.blueColor)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.1), radius: 10)
        .padding(.top, 24)
        .padding(.horizontal, 20)
    }
    
    // WIND
    private var wind: some View {
        VStack(spacing: 12) {
            HStack {
                Image(systemName: "wind")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold))
                
                Text("Wind")
                    .foregroundColor(.selectColor)
                    .font(.system(size: 24, weight: .semibold))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                AirQualityView(image: "speedometer", title: "Speed",
                               value: String(mainVM.dayForecaset?.windSpeed ?? 0) + " m/sec")
                
                AirQualityView(image: "safari", title: "Direction",
                               value: String(mainVM.dayForecaset?.windDirection ?? 0) + "°")
            }
            
            AirQualityView(image: "wind.circle", title: "Gust",
                           value: String(mainVM.dayForecaset?.windGust ?? 0) + " m/sec")
        }
        .padding(.horizontal, 28)
        .padding(.vertical, 20)
        .frame(maxWidth: .infinity)
        .background(Color.blueColor)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.1), radius: 10)
        .padding(.top, 8)
        .padding(.horizontal, 20)
    }
}
