//
//  FavoritesView.swift
//  Countries
//
//  Created by Furkan Deniz Albaylar on 6.08.2022.
//

import SwiftUI

struct FavoritesView: View {
  
  @EnvironmentObject var favorites: FavoriteCountries
  @Binding var countries: Countries?
  @State var localFavorites = Set<String>()
  @State var shouldUpdateFavorites: Bool = false
  
  var body: some View {
    VStack{
      if countries?.data == nil {
        ProgressView()
      } else {
        NavigationView {
          if let unWrappedData = countries?.data {
            
              
              List(unWrappedData.filter({localFavorites.contains($0.code)})) { country in
              NavigationLink(destination: DetailedView(shouldUpdateFavorites: $shouldUpdateFavorites, countryCode: country.code)) {
                  HStack {
                  Text(country.name)
                  Spacer()
                  Button {
                    favorites.CountryToggle(country.code)
                    self.localFavorites = favorites.CodeOfCountry
                  } label: {
                    Image(systemName: favorites.contains(country.code) ? "star.fill" : "star")
                          .foregroundColor(.gray)
                  }.buttonStyle(PlainButtonStyle())
                }
              }
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle("Countries")
          }
        }.onAppear{
          self.localFavorites = favorites.CodeOfCountry
        }.onChange(of: shouldUpdateFavorites) { _ in
          if shouldUpdateFavorites {
            self.localFavorites = favorites.CodeOfCountry
            shouldUpdateFavorites = false
          }
        }
      }
    }
  }
}

