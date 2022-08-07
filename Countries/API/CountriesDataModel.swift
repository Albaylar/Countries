//
//  CountriesModel.swift
//  Countries
//
//  Created by Furkan Deniz Albaylar on 6.08.2022.
//

import SwiftUI


struct Countries: Codable {
  let data: [CountryResult]
}

struct CountryResult: Codable, Identifiable, Hashable {
  let code: String
  let name: String
  var id: String { code }
  
  enum CodingKeys: String, CodingKey {
    case code
    case name
  }
}
struct CountryDetail: Codable {
  let data: CountryDetails
}
// DATA CALASSES
struct CountryDetails: Codable {
  let name: String
  let code: String
  let flagImageURI: String
  let wikiDataID: String
  
  enum CodingKeys: String, CodingKey {
    case wikiDataID = "wikiDataId"
    case flagImageURI = "flagImageUri"
    case name
    case code
  }
}
