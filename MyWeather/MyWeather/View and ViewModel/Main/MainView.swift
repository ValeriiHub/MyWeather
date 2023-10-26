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
            Color.backgroundApp
                .ignoresSafeArea()
            
            // MAIN CONTENT
            VStack(spacing: 0) {
                // HEADER
                header
                
                // SEARCH
                search
                
                // WEATHER
                weather
                
                // AIR QUALITY
                airQuality
            }
            .padding(.horizontal, 20)
            
            // SETTINGS
            settings
        }
    }
}

//MARK: - Preview

#Preview {
    MainView()
}

//MARK: - Extension

extension MainView {
    //MARK: VIEW COMPONENTS
    
    // HEADER
    private var header: some View {
        ZStack {
            // SETTINGS BUTTON
            Button {
                isSettingsShow.toggle()
            } label: {
                Image(systemName: "text.alignleft")
                    .font(.system(size: 24))
                    .foregroundColor(.selectApp)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // HEADER
            HStack(spacing: 8) {
                // IMAGE
                Image(systemName: "location.circle")
                    .font(.system(size: 20))
                
                VStack(spacing: 4) {
                    // CITY
                    Text("Denmark")
                        .font(.system(size: 22, weight: .bold))
                    
                    // DATE
                    Text("Sunday, 12 Sep")
                        .font(.system(size: 12))
                }
                .foregroundColor(.selectApp)
                .padding(.trailing, 28)
            }
        }
        .frame(height: 48)
    }
    
    // SEARCH
    private var search: some View {
        SearchView(text: $mainVM.searchCity)
            .padding(.vertical, 12)
    }
    
    // WEATHER
    private var weather: some View {
        HStack(spacing: 28) {
            // WEATHER IMAGE
            VStack {
                Image("sunIcon")
                    .resizable()
                    .frame(width: 180, height: 180)
                
                Text("Clouds")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.selectApp)
            }
            
            // WEATHER DATA
            VStack(alignment: .leading, spacing: 8) {
                Text("23°")
                    .font(.system(size: 60, weight: .bold))
                    .foregroundColor(.white)
                
                Group {
                    Text("Feels like 26°")
                    
                    Label("8 km/h", systemImage: "wind")
                    
                    Label("37%", systemImage: "drop")
                }
                .font(.system(size: 20))
                .foregroundColor(.selectApp)
            }
        }
        .padding(.top, 12)
    }
    
    // AIR QUALITY
    private var airQuality: some View {
        VStack {
            HStack {
                Image(systemName: "cloud")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold))
                
                Text("Air Quality")
                    .foregroundColor(.selectApp)
                    .font(.system(size: 24, weight: .semibold))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 12)

            HStack {
                AirQualityView(image: "cloud.sun", title: "Max", value: "22.8")

                AirQualityView(image: "cloud", title: "Min", value: "22.8")
            }
            
            HStack {
                AirQualityView(image: "cloud.sun.rain", title: "Pressure", value: "22.8")

                AirQualityView(image: "cloud", title: "Humidity", value: "22.8")
            }
            
            HStack {
                AirQualityView(image: "sunrise.fill", title: "Sunrise", value: "8km/h")

                AirQualityView(image: "sunset.fill", title: "Sunset", value: "22.8")
            }
        }
        .padding(.horizontal, 28)
        .frame(height: 220)
        .frame(maxWidth: .infinity)
        .background(Color.blueApp)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.2), radius: 10)
        .padding(.top, 24)
    }
    
    
    
    // SETTINGS
    private var settings: some View {
        ZStack {
            if isSettingsShow {
                // BACKGROUND
                Color.black
                    .opacity(0.5)
                    .ignoresSafeArea()
                
                // MENU
                SettingsView(isSettingsShow: $isSettingsShow)
                    .padding(.trailing, 120)
                    .transition(.move(edge: .leading))
            }
        }
        .animation(.easeInOut, value: isSettingsShow)
    }
}
