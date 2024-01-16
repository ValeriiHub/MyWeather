//
//  CitiesRow.swift
//  MyWeather
//
//  Created by Valerii on 16.01.2024.
//

import SwiftUI

struct CitiesRow: View {
    var body: some View {
        Text("Kyiv")
            .font(.system(size: 32, weight: .medium))
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: 80)
            .background(Color.blueColor)
            .cornerRadius(30)
    }
}

#Preview {
    CitiesRow()
}
