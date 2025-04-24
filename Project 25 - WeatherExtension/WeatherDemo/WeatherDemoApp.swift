//
//  GoodAsOldPhonesApp.swift
//  WeatherDemo
//
//  Created by Yaron Jackoby on 24/04/2025.
//  Copyright © 2025 AppCoda. All rights reserved.
//


import SwiftUI

@main
struct WeatherDemoApp: App {
    var body: some Scene {
        WindowGroup {
            WeatherView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.blue)
            .ignoresSafeArea()
        }
    }
}
