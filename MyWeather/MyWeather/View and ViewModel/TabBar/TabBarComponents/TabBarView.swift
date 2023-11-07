//
//  TabBarView.swift
//  MyWeather
//
//  Created by Valerii on 27.10.2023.
//

import SwiftUI

enum TabBar: String, CaseIterable {
    case week = "Week"
    case main = "Main"
    case saved = "Saved"
    
    var title: String {
        self.rawValue
    }
    
    var image: String {
        switch self {
        case .saved:
            return "star.square"
        case .main:
            return "cloud.sun.fill"
        case .week:
            return "calendar"
        }
    }
}

struct TabBarView: View {
    
    //MARK: - @Property Wrappers
    
    @State private var selectedView: TabBar = .main
    
    //MARK: - View
    
    var body: some View {
        // TABBAR
        NavigationView {            
            // SCREENS
            ZStack(alignment: .bottom) {
                switch selectedView {
                case .week:
                    WeekForecastView()
                case .main:
                    MainView()
                case .saved:
                    EmptyView()
                }
                
                // TABBAR
                CustomTabBarView(tab: $selectedView)
                    .padding(.horizontal, 24)
                    .padding(.bottom, 20)
                    .zIndex(1)
            }
            .ignoresSafeArea(edges: .bottom)
        }
        .navigationBarHidden(true)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
