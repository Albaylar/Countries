//
//  FavoriteCountries.swift
//  Countries
//
//  Created by Furkan Deniz Albaylar on 6.08.2022.
//

import Foundation
import SwiftUI

class FavoriteCountries: ObservableObject {
  var CodeOfCountry: Set<String>
  
  private let favoriteKey = "Favorites"
  
  init() {
    self.CodeOfCountry = []
    self.CountryFavLoad()
  }
  
  func contains(_ countryCode: String) -> Bool {
    CodeOfCountry.contains(countryCode)
  }
  
  func CountryFavAdd(_ countryCode: String) {
    objectWillChange.send()
    CodeOfCountry.insert(countryCode)
    CountryFavSave()
  }
  
  func CountryFavRemove(_ countryCode: String) {
    objectWillChange.send()
    CodeOfCountry.remove(countryCode)
    CountryFavSave()
  }

  func CountryFavSave() {
    do {
      let fileName = getDocumentsDirectory().appendingPathComponent("Saved Countries")
      let countryIds = Array(self.CodeOfCountry)
      let data = try JSONEncoder().encode(countryIds)
      try data.write(to: fileName, options: [.atomicWrite, .completeFileProtection])
      print("Country data saved or removed")
    } catch {
      print("Unable to save data")
    }
  }
  
  func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
  }
  
  func CountryFavLoad() {
    let fileName = getDocumentsDirectory().appendingPathComponent("Saved Countries")
    do {
      let data = try Data(contentsOf: fileName)
      let countryIds = try JSONDecoder().decode([String].self, from: data)
      CodeOfCountry = Set(countryIds)
    } catch {
      print("Unable to load saved data.")
    }
  }
  
  func CountryToggle(_ countryCode: String) {
    if self.contains(countryCode) {
        self.CountryFavRemove(countryCode)
    } else {
        self.CountryFavAdd(countryCode)
    }
  }
}
