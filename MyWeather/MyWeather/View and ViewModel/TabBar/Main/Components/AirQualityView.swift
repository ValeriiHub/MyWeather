//
//  AirQualityView.swift
//  MyWeather
//
//  Created by Valerii on 09.10.2023.
//

import SwiftUI

struct AirQualityView: View {
    
    let image: String
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .foregroundColor(.white)
                .font(.system(size: 20))
            
            VStack(alignment: .leading) {
                Text(title)
                    .foregroundColor(.gray)
                
                Text(value)
                    .foregroundColor(.selectColor)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct AirQualityView_Previews: PreviewProvider {
    static var previews: some View {
        AirQualityView(image: "wind", title: "Real feel", value: "22.8")
    }
}
