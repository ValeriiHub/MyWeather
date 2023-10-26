//
//  PreloaderView.swift
//  MyWeather
//
//  Created by Valerii on 08.10.2023.
//

import SwiftUI

struct PreloaderView: View {

//MARK: - Body
    
    var body: some View {
        ZStack {
            // BACKGROUND
            Color.backgroundApp
               .ignoresSafeArea()

            // MAIN CONTENT
            VStack(spacing: 20) {
                // IMAGE
                Image(ViewImage.sunIcon.image)
                    .resizable()
                    .frame(width: 200, height: 200)
                
                Text(ViewText.title.text)
                    .font(.system(size: 70, weight: .bold))
                    .foregroundColor(.selectApp)
            }
        }
    }
}

//MARK: - Preview

#Preview {
    PreloaderView()
}

//MARK: - Extension

extension PreloaderView {
    //MARK: VIEW COMPONENTS
    
    // HEADER
    private var header: some View {
        Text("Hello")
    }
}

//MARK: - Resources

extension PreloaderView {
    // text
    enum ViewText: String {
        case title = "Weather"

    var text: String {
            rawValue
        }
    }
    
    // image name
    enum ViewImage: String {
        case sunIcon

    var image: String {
            rawValue
        }
    }
}
