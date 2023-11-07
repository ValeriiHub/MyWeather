//
//  ForecastRowView.swift
//  MyWeather
//
//  Created by Valerii on 26.10.2023.
//

import SwiftUI

struct ForecastRowView: View {
    
    let dayForecast: WeekForecastVM
    
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 0) {
                Text("\(dayForecast.temperature, specifier: "%.0f")°")
                    .font(.system(size: 86, weight: .bold))
                    .foregroundColor(.white)
                
                Text(dayForecast.date)
                    .font(.system(size: 20))
                    .foregroundColor(.selectColor)
            }
            
            Spacer()
            
            VStack(spacing: 16) {
                Image("sunIcon")
                    .resizable()
                    .frame(width: 80, height: 80)
                
                Text("H:\(dayForecast.maxTemp, specifier: "%.0f")° M: \(dayForecast.minTemp, specifier: "%.0f")°")
                    .font(.system(size: 18))
                    .foregroundColor(.white)
            }
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity)
        .cornerRadius(12)
    }
}
