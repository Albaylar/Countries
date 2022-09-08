//
//  CountryItem.swift
//  Countries
//
//  Created by Furkan Deniz Albaylar on 7.08.2022.
//

import Foundation
import SwiftUI

struct Countries: Codable {
  let data: [CountryResult]
}
struct CountryResult: Codable ,Identifiable, Hashable {
  let code: String
  let name: String
  var id: String { code }
}
struct CountryDetail: Codable {
  let data: CountryDetails
  
}
struct CountryDetails: Codable {
  let name: String
  let code: String
  let flagImageURI: String
  let wikiDataID: String
  
private enum CodingKeys: String, CodingKey {
    case wikiDataID = "wikiDataId"
    case flagImageURI = "flagImageUri"
    case name,code
  }
}
