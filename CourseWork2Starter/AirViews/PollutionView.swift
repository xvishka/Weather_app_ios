//
//  PollutionView.swift
//  Coursework2
//
//  Created by Kavindu Avishka on 2023-05-07.
//

import SwiftUI

struct PollutionView: View {
    
    @EnvironmentObject var modelData: ModelData

    var body: some View {
        
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Text("\(modelData.userLocation)")
                    .font(.largeTitle)
                
                Text("\((Int)(modelData.forecast!.current.temp))ºC")
                    .font(.largeTitle)
                
                HStack {
                    AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(modelData.forecast!.current.weather[0].icon)@2x.png"))
                    
                    Text(modelData.forecast!.current.weather[0].weatherDescription.rawValue.capitalized)
                        .font(.title2)
                }
                
                Text("Feels Like: \((Int)(modelData.forecast!.current.feelsLike))ºC")
                    .font(.title2)
                
                HStack(spacing: 20) {
                    AirPollutionView(imageName: "so2", airQualityData: modelData.airPollution?.list[0].components.so2)
                    
                    AirPollutionView(imageName: "no", airQualityData: modelData.airPollution?.list[0].components.no2)
                    
                    AirPollutionView(imageName: "voc", airQualityData: modelData.airPollution?.list[0].components.co)
                    
                    AirPollutionView(imageName: "pm", airQualityData: modelData.airPollution?.list[0].components.pm10)
                }
                
            }
        }
        .onAppear {
            Task {
                try await modelData.loadAirPollutionData()
            }
        }
        }
    }

    

