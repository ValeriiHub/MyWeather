//
//  MainView.swift
//  MyWeather
//
//  Created by Valerii on 08.10.2023.
//

import SwiftUI

struct MainView: View {
    
    //MARK: - @Property Wrappers
    
    @State private var isSettingsShow = false
    
    //MARK: - Properties
    
    
    
    //MARK: - Body
    
    var body: some View {
        ZStack(alignment: .top) {
            // BACKGROUND
            Color.backgroundColor
                .ignoresSafeArea()
            
            // MAIN CONTENT
            VStack(spacing: 0) {
                // HEADER
                header
                
                // WEATHER
                weather
                
                // AIR QUALITY
                airQuality
                
                // TODAY
                today
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
                    .foregroundColor(.selectColor)
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
                .foregroundColor(.selectColor)
                .padding(.trailing, 28)
            }
        }
        .frame(height: 48)
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
                    .foregroundColor(.selectColor)
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
                .foregroundColor(.selectColor)
            }
        }
        .padding(.top, 24)
    }
    
    // AIR QUALITY
    private var airQuality: some View {
        VStack {
            HStack {
                Image(systemName: "cloud")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold))
                
                Text("Air Quality")
                    .foregroundColor(.selectColor)
                    .font(.system(size: 24, weight: .semibold))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 12)

            HStack {
                AirQualityView(image: "cloud.sun", title: "Real feel", value: "22.8")

                AirQualityView(image: "cloud", title: "Real feel", value: "22.8")
            }
            
            HStack {
                AirQualityView(image: "cloud.sun.rain", title: "Real feel", value: "22.8")

                AirQualityView(image: "cloud", title: "Real feel", value: "22.8")
            }
            
            HStack {
                AirQualityView(image: "wind", title: "Wind", value: "8km/h")

                AirQualityView(image: "cloud", title: "Real feel", value: "22.8")
            }
        }
        .padding(.horizontal, 28)
        .frame(height: 220)
        .frame(maxWidth: .infinity)
        .background(Color.blueColor)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.2), radius: 10)
        .padding(.top, 24)
    }
    
    // TODAY
    private var today: some View {
        VStack {
            Text("Today")
                .foregroundColor(.selectColor)
                .font(.system(size: 24, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 6) {
                    ForEach(1...10, id: \.self) { count in
                        /*@START_MENU_TOKEN@*/Text("Placeholder \(count)")/*@END_MENU_TOKEN@*/
                    }
                }
            }
            .frame(height: 100)
        }
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

//MARK: - Resources

extension MainView {
    // text
    enum ViewText: String {
        case home = ""
        
        var text: String {
            rawValue
        }
    }
    
    // image name
    enum ViewImage: String {
        case backgrounImage
        
        var image: String {
            rawValue
        }
    }
}

