//
//  FetchCountries.swift
//  Countries
//
//  Created by Furkan Deniz Albaylar on 8.08.2022.
//

import Foundation
import SwiftUI

class FetchCounty : ObservableObject{
    func fetchCountries(completion:@escaping (Countries) -> ()) {
      let headers = [
        "x-rapidapi-host": Constants.host,
        "x-rapidapi-key": Constants.apiKey
      ]
      
      let request = NSMutableURLRequest(url: NSURL(string: "https://wft-geo-db.p.rapidapi.com/v1/geo/countries?limit=10")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
      URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error)  in
        do {
          if let data = data {
            let result = try JSONDecoder().decode(Countries.self, from: data)
            DispatchQueue.main.asyncAfter(deadline:.now()) {
              completion(result)
            }
          } else
            {
            print("There is no country Data")
          }
        }
        catch(let error) {
          debugPrint(error)
        }
      }).resume()
    }
    
}
