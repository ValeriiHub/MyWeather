//
//  SettingButton.swift
//  MyWeather
//
//  Created by Valerii on 08.10.2023.
//

import SwiftUI

struct SettingButton: View {
    
    let icon: String
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Image(systemName: icon)
                    .font(.system(size: 22))
                    .foregroundColor(.white)
                
                Text(title)
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(.selectApp)
                    .frame(height: 40)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    SettingButton(icon: "gear", title: "Settings") {}
        .background(Color.backgroundApp)
}
