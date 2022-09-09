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
            let appearance = UITabBarAppearance()
                              appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
                  appearance.backgroundColor = UIColor(Color.gray.opacity(0.7))
                              
            // Use this appearance when scrolling behind the TabView:
                UITabBar.appearance().standardAppearance = appearance
            // Use this appearance when scrolled all the way up:
                UITabBar.appearance().scrollEdgeAppearance = appearance
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

struct CellButton: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    HStack {
      Spacer()
      configuration.label.foregroundColor(.white)
      Spacer()
    }
    .padding()
    .foregroundColor(.black)
    .background(Color.white)
    .clipShape(RoundedRectangle(cornerRadius: 20))
    .scaleEffect(configuration.isPressed ? 0.95 : 1)
  }
}
