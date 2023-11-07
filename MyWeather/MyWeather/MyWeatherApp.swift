//
//  MyWeatherApp.swift
//  MyWeather
//
//  Created by Valerii on 08.10.2023.
//

import SwiftUI

@main
struct MyWeatherApp: App {
    
    @StateObject private var routerState = RouterState()
    
    var body: some Scene {
        WindowGroup {
            AppRouterView()
                .environmentObject(routerState)
        }
    }
}
