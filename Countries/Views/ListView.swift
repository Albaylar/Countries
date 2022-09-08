//
//  ListView.swift
//  Countries
//
//  Created by Furkan Deniz Albaylar on 6.08.2022.
//
import Foundation
import SwiftUI

struct CountryListView: View {
  @EnvironmentObject var favorites: FavoriteCountries
  @Binding var countries: Countries?
  
  var body: some View {
    VStack{
      if countries?.data == nil {
        Spacer()
        ProgressView()
      } else {
        NavigationView{
        if let data = countries?.data {
        List(data) { country in
            NavigationLink(destination: DetailView(countryCode: country.code)) {
                HStack {
                  Text(country.name)
                    Spacer()
                  Button {
                      favorites.CountryToggle(country.code)
                  } label: {
                    Image(systemName: favorites.contains(country.code) ? "star.fill" : "star")
                          .foregroundColor(.black)
                  }.buttonStyle(PlainButtonStyle())
                }
              }
            .padding(.all)
            .navigationBarTitle("Countries")
            .font(.subheadline)
            .listStyle(PlainListStyle()).cornerRadius(30)
            }
          }
        }
      }
    }
  }
}
