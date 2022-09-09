//
//  111.swift
//  Countries
//
//  Created by Furkan Deniz Albaylar on 9.09.2022.
//

import Foundation
class Cities : ObservableObject{
    func fetchCities(countryCode: String, completion: @escaping (Citiess) -> ()) {
      let headers = [
        "x-rapidapi-host": Constants.host,
        "x-rapidapi-key": Constants.apiKey
      ]
      let request = NSMutableURLRequest(url: NSURL(string: "https://wft-geo-db.p.rapidapi.com/v1/geo/adminDivisions")! as URL,
                                        cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
      request.httpMethod = "GET"
      request.allHTTPHeaderFields = headers
      URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error)  in
        do {
          if let data = data {
            let result = try JSONDecoder().decode(Citiess.self, from: data)
            DispatchQueue.main.async {
              completion(result)
            }
          } else {
            print("There is no Detail of data")
          }
        }
        catch(let error) {
        debugPrint(error)
        }
      }).resume()
    }
  }





