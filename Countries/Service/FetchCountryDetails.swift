//
//  FetchCountryDetails.swift
//  Countries
//
//  Created by Furkan Deniz Albaylar on 6.08.2022.
//


func fetchCountryDetails ( countrycode: String, completion:@escaping (CountryDetail) -> ()) {
  let headers = [
    "x-rapidapi-host": Constants.host,
    "x-rapidapi-key": Constants.apiKey
  ]
  
    let request = NSMutableURLRequest(url: NSURL(string: "https://wft-geo-db.p.rapidapi.com/v1/geo/countries/US")! as URL,
                                            cachePolicy: .useProtocolCachePolicy,
                                        timeoutInterval: 10.0)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers

    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if (error != nil) {
            print(error!)
        } else {
            let httpResponse = response as? HTTPURLResponse
            print(httpResponse!)
        }
    })

    dataTask.resume()
}
}
