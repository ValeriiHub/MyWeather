//
//  AppRouterView.swift
//  MyWeather
//
//  Created by Valerii on 27.10.2023.
//

import SwiftUI

class RouterState: ObservableObject {
    @Published var currentRouter: AppRouter = .preloader
}

enum AppRouter {
    case preloader
    case tabbar

    @ViewBuilder func createView(isPresent: Binding<Bool> = .constant(false)) -> some View {
        switch self {
        case .preloader:
            PreloaderView()
        case .tabbar:
            TabBarView()
        }
    }
}

struct AppRouterView: View {
    
    //MARK: - @Property Wrappers
    
    @AppStorage("isOnboardingShow") var isOnboardingShow = false
    
    @EnvironmentObject var routerState: RouterState
    
    //MARK: - Body
    
    var body: some View {
        VStack {
            switch routerState.currentRouter {
            case .preloader:
                AppRouter.preloader.createView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            routerState.currentRouter = .tabbar
                        }
                    }
            case .tabbar:
                AppRouter.tabbar.createView()
            }
        }
    }
}

