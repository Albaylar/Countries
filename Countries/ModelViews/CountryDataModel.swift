//
//  CountryDataModel.swift
//  Countries
//
//  Created by Furkan Deniz Albaylar on 7.08.2022.
//

import Foundation

struct CountryDataModel: Codable{
    let name: String
    let code: String
    let wikiDataID: String
    
    enum CodingKeys: String, CodingKey {
        case wikiDataID = "wikiDataId"
        case name, code
    }
}

