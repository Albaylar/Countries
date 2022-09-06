//
//  CountriesApp.swift
//  Countries
//
//  Created by Furkan Deniz Albaylar on 6.08.2022.
//
import SwiftUI
import SDWebImageSwiftUI
import SDWebImageSVGCoder

@main
struct CountriesApp: App {
    init() {
      setUpDependencies() // // Initialize SVGCoder
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// Initialize SVGCoder

private extension CountriesApp {
  func setUpDependencies() {
    SDImageCodersManager.shared.addCoder(SDImageSVGCoder.shared)
  }
}
