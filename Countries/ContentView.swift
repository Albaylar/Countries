//
//  ContentView.swift
//  Countries
//
//  Created by Furkan Deniz Albaylar on 6.08.2022.
//

import SwiftUI

struct FirstView: View {
    
    var text : String
    
    var body : some View {
        NavigationView{
        VStack{
            HStack {
                Spacer()
            }
            HStack{
                Spacer()
                Text(text)
                Spacer()
            }.background(Color.gray)
        }
        }
    }
}
    
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
        
              
      }.onAppear{
        
        
        UITabBar.appearance().barTintColor = UIColor.gray
          
          CountryService().fetchCountries { (countries ) in
          self.country = countries
      }

    }
      .accentColor(.black)
      .padding()
      .environmentObject(favorites)
          

  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
