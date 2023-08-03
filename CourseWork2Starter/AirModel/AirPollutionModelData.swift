//
//  AirPollutionModelData.swift
//  CourseWork2Starter
//
//  Created by Kavindu Avishka on 2023-05-07.
//

import Foundation

struct AirPollutionModelData: Codable {
    let coord: Coord
    let list: [AirPollutionDataList]
}

struct Coord: Codable {
    let lon: Double
    let lat: Double
}

struct AirPollutionDataList: Codable {
    let main: AirPollutionDataMain
    let components: AirPollutionDataComponents
    let dt: Int
}

struct AirPollutionDataMain: Codable {
    let aqi: Int
}

struct AirPollutionDataComponents: Codable {
    let co: Double
    let no: Double
    let no2: Double
    let o3: Double
    let so2: Double
    let pm2_5: Double
    let pm10: Double
    let nh3: Double
}
