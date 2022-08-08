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
      setUpDependencies()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
private extension CountriesApp {
  func setUpDependencies() {
    SDImageCodersManager.shared.addCoder(SDImageSVGCoder.shared)
  }
}
