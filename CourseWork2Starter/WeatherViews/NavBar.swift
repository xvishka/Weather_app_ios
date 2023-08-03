//
//  NavBar.swift
//  Coursework2
//
//  Created by Kavindu Avishka on 2023-05-07.
//

import SwiftUI

struct NavBar: View {
    @State private var selectedTab = 1
    
    var body: some View {
        TabView(selection: $selectedTab){
           Home()
                .tabItem{
                    Label("City",systemImage: "magnifyingglass")
                }
                .tag(0)
            CurrentWeatherView()
                .tabItem {
                    Label("Weather",systemImage: "sun.max.fill")
                }
                .tag(1)
            HourlyView()
                .tabItem{
                    Label("Summary",systemImage: "clock.fill")
                }
                .tag(2)
            ForecastView()
                .tabItem {
                    Label("Forecast",systemImage: "calendar")
                }
                .tag(3)
            PollutionView()
                .tabItem {
                    Label("Pollution",systemImage: "aqi.high")
                }
                .tag(4)
        }.onAppear {
            UITabBar.appearance().isTranslucent = false
        }
        
    }
        
}

