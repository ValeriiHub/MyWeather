//
//  ForecastRowView.swift
//  MyWeather
//
//  Created by Valerii on 26.10.2023.
//

import SwiftUI

struct ForecastRowView: View {
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 0) {
                Text("23°")
                    .font(.system(size: 86, weight: .bold))
                    .foregroundColor(.white)
                
                Text("Wednesday, 12 Sep")
                    .font(.system(size: 20))
                    .foregroundColor(.selectApp)
            }
            
            Spacer()
            
            VStack(spacing: 16) {
                Image("sunIcon")
                    .resizable()
                    .frame(width: 80, height: 80)
                
                Text("H:23° M: 23°")
                    .font(.system(size: 18))
                    .foregroundColor(.white)
            }
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity)
        .cornerRadius(12)
    }
}
