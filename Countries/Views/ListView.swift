//
//  ListView.swift
//  Countries
//
//  Created by Furkan Deniz Albaylar on 6.08.2022.
//
import Foundation
import SwiftUI
import SDWebImage
import SDWebImageSVGCoder

struct CountryListView: View {
  @EnvironmentObject var favorites: FavoriteCountries
  @Binding var countries: Countries?
  
  var body: some View {
    VStack{
      if countries?.data == nil {
        ProgressView()
      } else {
        NavigationView {
          if let data = countries?.data {
              List(data) { country in
              NavigationLink(destination: DetailView(countryCode: country.code)) {
                HStack {
                Image(country.code)
                  Text(country.name)
                    Spacer()
                  Button {
                      favorites.CountryToggle(country.code)
                  } label: {
                    Image(systemName: favorites.contains(country.code) ? "star.fill" : "star")
                          .foregroundColor(.black)
                  }
                        
                }
              }
              .navigationBarTitle("Countries")
            }.listStyle(PlainListStyle()).cornerRadius(30)
            
                  
          }
        }
        
        .padding(.all)
      }
    }
  }
}
