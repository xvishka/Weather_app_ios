//
//  AirPollutionView.swift
//  CourseWork2Starter
//
//  Created by Kavindu Avishka on 2023-05-07.
//

import SwiftUI

struct AirPollutionView: View {
    
    var imageName: String?
    var airQualityData: Double?
    
    var body: some View {
        VStack {
            Image("\(imageName!)")
                .resizable()
                .frame(width: 50, height: 50)
            
            Text("\(String(format: "%.2f", airQualityData ?? 0))")
                .font(.title2)
        }
        
    }
}

struct AirPollutionView_Previews: PreviewProvider {
    static var previews: some View {
        AirPollutionView()
    }
}
