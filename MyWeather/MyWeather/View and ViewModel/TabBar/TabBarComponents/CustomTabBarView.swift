//
//  CustomTabBarView.swift
//  MyWeather
//
//  Created by Валерий Д on 08.11.2023.
//

import SwiftUI

struct CustomTabBarView: View {
    
    @Binding var tab: TabBar
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(TabBar.allCases, id: \.self) { tabbarIndex in
                TabBarCellView(tabBar: tabbarIndex, isSelected: tab == tabbarIndex)
                .onTapGesture {
                    tab = tabbarIndex
                }
            }
        }
        .background(Color.tabbarColor)
        .cornerRadius(14)
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarView(tab: .constant(.main))
    }
}
