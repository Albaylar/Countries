//
//  RapıdAPI.swift
//  Countries
//
//  Created by Furkan Deniz Albaylar on 6.08.2022.
//

// - CountryResponse
struct CountryResponse: Codable {
    let countryData: [CountryData]
  
  enum CodingKeys: String, CodingKey {
    case countryData = "data"
  }
}

// MARK: - CountryData
struct CountryData: Codable {
    let code: String
    let currencyCodes: [String]
    let name, wikiDataID: String

    enum CodingKeys: String, CodingKey {
        case code, currencyCodes, name
        case wikiDataID = "wikiDataId"
    }
}
