//
//  ContentView.swift
//  Countries
//
//  Created by Furkan Deniz Albaylar on 6.08.2022.
//

import SwiftUI
import SDWebImageSwiftUI
import SDWebImageSVGCoder

struct ContentView: View {
  @State var country: Countries?
  @ObservedObject var favorites = FavoriteCountries()

    var body: some View {
        TabView() {
              CountryListView(countries: $country)
                  .tabItem{
                    Label("Home", systemImage: "house.fill")
                }
              FavoritesView(countries: $country)
                .tabItem{
                    Label("Saved", systemImage: "heart.fill")
                }
              }
        .onAppear
              {
                  FetchCounty().fetchCountries { (countries ) in
                  self.country = countries
              }
              }
              .accentColor(.black)
              .environmentObject(favorites)
              .foregroundColor(.black)
        }
    }

        
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct RoundedRectangleButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    HStack {
      Spacer()
      configuration.label.foregroundColor(.white)
      Spacer()
    }
    .padding()
    .background(Color.blue.cornerRadius(20))
    .scaleEffect(configuration.isPressed ? 0.95 : 1)
  }
}
