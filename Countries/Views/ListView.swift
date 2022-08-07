//
//  ListView.swift
//  Countries
//
//  Created by Furkan Deniz Albaylar on 6.08.2022.
//

import SwiftUI

struct ListView: View {
  
  @EnvironmentObject var favorites: FavoriteCountries
  @Binding var countries: Countries?
  
  var body: some View {
    VStack{
      if countries?.data == nil {
        ProgressView()
      } else {
        NavigationView {
          if let unWrappedData = countries?.data {
            List(unWrappedData) { country in
              NavigationLink(destination: DetailedView(countryCode: country.code)) {
                HStack {
                  Text(country.name)
                  Spacer()
                  Button {
                    favorites.CountryToggle(country.code)
                  } label: {
                    Image(systemName: favorites.contains(country.code) ? "star.fill" : "star")
                          .foregroundColor(.gray)
                  }.buttonStyle(PlainButtonStyle())
                        
                }
              }
            }.listStyle(PlainListStyle())
              .navigationBarTitle("Countries")
          }
        }
      }
    }
  }
}
