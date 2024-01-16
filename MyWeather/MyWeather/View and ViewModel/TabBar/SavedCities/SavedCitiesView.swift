//
//  SavedCitiesView.swift
//  MyWeather
//
//  Created by Valerii on 15.01.2024.
//

import SwiftUI

struct SavedCitiesView: View {
    
    //MARK: - Properties
    
    @StateObject private var savedCitiesVM = SavedCitiesViewModel()
    
    //MARK: - Body
    
    var body: some View {
        ZStack(alignment: .top) {
            // BACKGROUND
            Color.backgroundColor
                .ignoresSafeArea()
            
            // MAIN CONTENT
            VStack(spacing: 0) {
                header
                
                search
                
                cities
            }
            .padding(.horizontal, 20)
        }
    }
}

//MARK: - Extension

extension SavedCitiesView {
    
    // HEADER
    private var header: some View {
        Text(ViewText.title.text)
    }
    
    // SEARCH
    private var search: some View {
        SearchView(text: $savedCitiesVM.searchText)
            .padding(.vertical, 12)
    }
    
    // CITIES
    private var cities: some View {
        VStack(spacing: 12) {
            ForEach(0..<5) { item in
                CitiesRow()
            }
        }
    }
}

//MARK: - Resources

extension SavedCitiesView {
    // text
    enum ViewText: String {
        case title = ""
        
        var text: String {
            rawValue
        }
    }
}

//MARK: - Preview

#Preview {
    SavedCitiesView()
}
