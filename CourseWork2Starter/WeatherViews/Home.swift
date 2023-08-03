//
//  HomeView.swift
//  CWK2_23_GL
//
//  Created by Kavindu Avishka on 10/03/2023.
//

import SwiftUI
import CoreLocation

struct Home: View {
    
    @EnvironmentObject var modelData: ModelData
    @State var isSearchOpen: Bool = false
    @State  var userLocation: String = ""
    
    
    var body: some View {
        ZStack {
            Image("background2")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Button {
                    self.isSearchOpen.toggle()
                } label: {
                    Text("Change Location")
                        .font(.system(size: 25))
                        .bold()
                }
                .sheet(isPresented: $isSearchOpen) {
                    SearchView(isSearchOpen: $isSearchOpen, userLocation: $userLocation)
                }
                
                Spacer()
                
                Text(userLocation)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                
                Text(Date(timeIntervalSince1970: TimeInterval(((Int)(modelData.forecast?.current.dt ?? 0))))
                    .formatted(.dateTime.year().hour().month().day()))
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)

                Spacer()
                
                VStack(spacing: 15){
                    Text("Temp : \((Int)(modelData.forecast!.current.temp))ºC")
                    Text("Humidity : \(modelData.forecast!.current.humidity)%")
                    Text("Pressure : \(modelData.forecast!.current.pressure) hPa")
                    
                    HStack {
                        AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(modelData.forecast!.current.weather[0].icon)@2x.png"))
                        Text("\(modelData.forecast!.current.weather[0].weatherDescription.rawValue.capitalized)")
                    }
                }
                .font(.title2)
            }
            .onAppear {
                Task.init {
                    self.userLocation = await getLocFromLatLong(lat: modelData.forecast!.lat, lon: modelData.forecast!.lon)
                    self.modelData.userLocation = userLocation
                }
            }
        }
    }
}
