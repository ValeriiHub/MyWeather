//
//  SearchView.swift
//  MyWeather
//
//  Created by Valerii on 26.10.2023.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var text: String
        
    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: "magnifyingglass")
            
            TextField( "Search for a city", text: $text)
        }
        .font(.system(size: 20))
        .foregroundColor(.grayApp)
        .padding(.horizontal, 8)
        .frame(height: 50)
        .background(Color.blueApp)
        .cornerRadius(30)
    }
}

#Preview {
    SearchView(text: .constant(""))
}
