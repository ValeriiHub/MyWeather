//
//  SettingsView.swift
//  MyWeather
//
//  Created by Valerii on 08.10.2023.
//

import SwiftUI

struct SettingsView: View {
    
    //MARK: - @Property Wrappers
    
    @Binding var isSettingsShow: Bool
    
    //MARK: - Body
    
    var body: some View {
        ZStack {
            // BACKGROUND
            Color.backgroundColor
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // HEADER
                header
                
                // BUTTONS
                buttons
                
                Spacer()
            }
            .padding(.leading, 20)
        }
    }
}

//MARK: - Preview

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(isSettingsShow: .constant(false))
    }
}

extension SettingsView {
    //MARK: VIEW COMPONENTS
    
    // HEADER
    private var header: some View {
        HStack(spacing: 14) {
            // CLOSE BUTTON
            Button {
                withAnimation { isSettingsShow.toggle() }
            } label: {
                Image(systemName: ViewImage.arrowLeft.image)
                    .font(.system(size: 24))
                    .foregroundColor(.selectColor)
            }
            
            // TITLE
            Text(ViewText.title.text)
                .font(.system(size: 20))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(height: 48)
    }
    
    // BUTTONS
    private var buttons: some View {
        VStack(alignment: .leading, spacing: 16) {
            // SAVED NEWS
            SettingButton(icon: "gear", title: ViewText.savedNews.text) {
                
            }
            
            // ABOUT US
            SettingButton(icon: "gear", title: ViewText.aboutUs.text) {
                
            }
            
            // TERMS OF USE
            SettingButton(icon: "gear", title: ViewText.terms.text) {
                
            }
            
            // PRIVACY POLICY
            SettingButton(icon: "gear", title: ViewText.privacy.text) {
                
            }
        }
        .padding(.top, 20)
    }
}

//MARK: - Resources

extension SettingsView {
    // text
    enum ViewText: String {
        case title = "Settings"
        case savedNews = "Saved News"
        case aboutUs = "About Us"
        case terms = "Terms of Use"
        case privacy = "Privacy Policy"
        
        var text: String {
            rawValue
        }
    }
    
    // image name
    enum ViewImage: String {
        case arrowLeft = "arrow.left"
        
        var image: String {
            rawValue
        }
    }
}
