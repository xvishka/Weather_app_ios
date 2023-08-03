//
//  CourseWork2StarterApp.swift
//  CourseWork2Starter
//
//  Created by Kavindu Avishka on 2023-05-07.
//

import SwiftUI

@main
struct CourseWork2StarterApp: App {
    @StateObject var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
