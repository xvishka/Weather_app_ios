//
//  DailyView.swift
//  Coursework2
//
//  Created by Kavindu Avishka on 2023-05-07.
//

import SwiftUI

struct DailyView: View {
    var day : Daily
   
    var body: some View {
        
        HStack {
            AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(day.weather[0].icon)@2x.png"))
            
            Spacer()
            
            VStack {
                Text("\(day.weather[0].weatherDescription.rawValue.capitalized)")
                
                Text(Date(timeIntervalSince1970: TimeInterval(((Int)(day.dt))))
                    .formatted(.dateTime.weekday().day()))
            }
            
            Spacer()
            
            Text("\((Int)(day.temp.max))ºC / \((Int)(day.temp.min))ºC")
           
           
        }.padding()
    }
    
}

struct DailyView_Previews: PreviewProvider {
    static var day = ModelData().forecast!.daily
    
    static var previews: some View {
        DailyView(day: day[0])
    }
}
