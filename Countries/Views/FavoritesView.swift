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
        HStack{
      if countries?.data == nil {
        Spacer()
        ProgressView()
        Spacer()
      } else {
        NavigationView {
        if let data = countries?.data {
        List(data.filter({localFavorites.contains($0.code)})) { country in
            NavigationLink(destination: DetailView(shouldUpdateFavorites: $shouldUpdateFavorites, countryCode: country.code)) {
                    HStack {
                        Text(country.name)
                        Spacer()
                        Button {
                            favorites.CountryToggle(country.code)
                            self.localFavorites = favorites.CodeOfCountry
                        } label: {
                            Image(systemName: favorites.contains(country.code) ? "star.fill" : "star")
                                .foregroundColor(.black)
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.all)
                .navigationBarTitle("Countries")
                .navigationBarTitleDisplayMode(.inline)
                .font(.subheadline)
                .listStyle(PlainListStyle()).cornerRadius(30)
                .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.black, lineWidth: 4))
        }
        
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
}
