//
//  Conditions.swift
//  Coursework2
//
//  Created by Kavindu Avishka on 2023-05-07.
//

import SwiftUI

struct CurrentWeatherView: View {
    @EnvironmentObject var modelData: ModelData
    
    @State var locationString: String = "No location"
    
    var body: some View {
        ZStack {
            Image("background2")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                Text("\(modelData.userLocation)")
                    .font(.largeTitle)
                    .bold()
                
                Text("\((Int)(modelData.forecast!.current.temp))ºC")
                    .padding()
                    .font(.largeTitle)
                
                HStack {
                    AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(modelData.forecast!.current.weather[0].icon)@2x.png"))
                    
                    Text(modelData.forecast!.current.weather[0].weatherDescription.rawValue.capitalized)
                }
                
                Text("Feels Like: \((Int)(modelData.forecast!.current.feelsLike))ºC")
      
                VStack(){
                    HStack {
                        Text("Wind Speed: \((Int)(modelData.forecast!.current.windSpeed)) m/s")
                        Spacer()
                        Text("Direction: \(convertDegToCardinal(deg: modelData.forecast!.current.windDeg))")
                    }
                    .padding()
                    
                    HStack {
                        Text("Humidity: \(modelData.forecast!.current.humidity) %")
                        Spacer()
                        Text("Pressure: \(modelData.forecast!.current.pressure) hPa")
                    }
                }
                .font(.title2)
                
                HStack {
                    Label(
                        title: {
                            Text("\(Date(timeIntervalSince1970: TimeInterval(((Int)(modelData.forecast?.current.sunrise ?? 0)))).formatted(.dateTime.hour().minute()))")},
                        icon: {
                            Image(systemName: "sunrise.fill")
                                .symbolRenderingMode(.multicolor)}
                    )
                    
                    Label(
                        title: {
                            Text("\(Date(timeIntervalSince1970: TimeInterval(((Int)(modelData.forecast?.current.sunset ?? 0)))).formatted(.dateTime.hour().minute()))")},
                        icon: {
                            Image(systemName: "sunset.fill")
                                .symbolRenderingMode(.multicolor)}
                    )
                }
            }
            .padding(10)
            .font(.title2)
        }
    }
}

struct Conditions_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView()
            .environmentObject(ModelData())
    }
}
