//
//  TabBarCellView.swift
//  MyWeather
//
//  Created by Валерий Д on 08.11.2023.
//

import SwiftUI

struct TabBarCellView: View {
    
    let tabBar: TabBar
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 5) {
            Image(systemName: tabBar.image)
                .font(.system(size: 22))
                .foregroundColor(!isSelected ? Color.selectColor : .white)
            
            Text(tabBar.title)
                .font(.system(size: 12))
                .foregroundColor(!isSelected ? Color.selectColor : .white)
        }
        .frame(height: 60)
        .frame(maxWidth: .infinity)
    }
}

struct TabBarCellView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarCellView(tabBar: .saved, isSelected: false)
    }
}
