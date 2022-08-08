//
//  DetailDataModel.swift
//  Countries
//
//  Created by Furkan Deniz Albaylar on 7.08.2022.
//

import Foundation

struct DetailDataModel: Codable{
    let data: CountryDetail
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}

