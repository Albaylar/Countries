//
//  FetchCountries.swift
//  Countries
//
//  Created by Furkan Deniz Albaylar on 6.08.2022.
//
import Foundation

class CountryService: ObservableObject {
  
  func fetchCountries( completion : @escaping (Countries) -> ()) {
      let headers = [
          "X-RapidAPI-Key": Constant.host,
          "X-RapidAPI-Host": Constant.apiKey
      ]

      let request = NSMutableURLRequest(url: NSURL(string: "https://wft-geo-db.p.rapidapi.com/v1/geo/countries?limit=10")! as URL,
                                              cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
      request.httpMethod = "GET"
      request.allHTTPHeaderFields = headers

      let session = URLSession.shared
      let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
          if (error != nil) {
              print(error as Any)
          } else {
              let httpResponse = response as? HTTPURLResponse
              print(httpResponse as Any)
          }
      })
      dataTask.resume()

    URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error)  in
      do {
        if let data = data {
          let result = try JSONDecoder().decode(Countries.self, from: data)
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            completion(result)
          }
        } else {
          print("No data")
        }
      }
      catch(let error) {
        debugPrint(error)
      }
    }).resume()
  }
  

  func fetchCountryDetails(countryCode: String, completion:@escaping (CountryDetail) -> ()) {
      let headers = [
          "X-RapidAPI-Key": Constant.host,
          "X-RapidAPI-Host": Constant.apiKey
      ]
      let request = NSMutableURLRequest(url: NSURL(string: "https://wft-geo-db.p.rapidapi.com/v1/geo/countries/US")! as URL,
                                              cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
      request.httpMethod = "GET"
      request.allHTTPHeaderFields = headers

      let session = URLSession.shared
      let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
          if (error != nil) {
              print(error as Any)
          } else {
              let httpResponse = response as? HTTPURLResponse
              print(httpResponse as Any)
          }
      })

      dataTask.resume()
    
    URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error)  in
      do {
        if let data = data {
            let result = try JSONDecoder().decode(CountryDetail.self, from: data)
          DispatchQueue.main.async {
            completion(result)
          }
        } else {
          print("No data")
        }
      }
      catch(let error) {
        debugPrint(error)
      }
    }).resume()
  }
}

