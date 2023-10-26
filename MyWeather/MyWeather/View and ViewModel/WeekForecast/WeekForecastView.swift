//
//  WeekForecastView.swift
//  MyWeather
//
//  Created by Valerii on 26.10.2023.
//

import SwiftUI

struct WeekForecastView: View {
    
    //MARK: - @Property Wrappers
    
    @StateObject private var weekForecastVM = WeekForecastViewModel()
    
    //MARK: - Properties
    
    
    
    //MARK: - Body
    
    var body: some View {
        ZStack(alignment: .top) {
            // BACKGROUND
            Color.backgroundApp
                .ignoresSafeArea()
                .onAppear {
                    weekForecastVM.fetchWeather()
                }
            
            // MAIN CONTENT
            VStack(spacing: 0) {
                // HEADER
                header
                
                // WEATHER
                forecast
            }
            .padding(.horizontal, 24)
        }
    }
}

//MARK: - Preview

#Preview {
    WeekForecastView()
}

//MARK: - Extension

extension WeekForecastView {
    //MARK: VIEW COMPONENTS
    
    // HEADER
    private var header: some View {
        ZStack {
            // SETTINGS BUTTON
            Button {
//                isSettingsShow.toggle()
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
    
    // WEEK FORECAST
    private var forecast: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 16) {
                ForEach(weekForecastVM.weekForecaset, id: \.dt) { day in
                    ForecastRowView(dayForecast: day)
                }
            }
        }
        .padding(.top, 12)
    }
}

//MARK: - Resources

extension WeekForecastView {
    // text
    enum ViewText: String {
        case home = ""
        
        var text: String {
            rawValue
        }
    }
}
