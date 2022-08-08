//
//  ContentView.swift
//  Countries
//
//  Created by Furkan Deniz Albaylar on 6.08.2022.
//

import SwiftUI
import SDWebImageSwiftUI
import SDWebImageSVGCoder

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
              }.onAppear
              {
                  UITabBar.appearance().barTintColor = UIColor.gray
                
                  CountryService().fetchCountries { (countries ) in
                  self.country = countries
              }

            }.accentColor(.black)
              .padding()
              .environmentObject(favorites)
              .foregroundColor(Color.black)
                  

          }
        }

        
        
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct NewButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    Button(action: {}, label: {
        configuration.label.foregroundColor(.white)
      }
    )
    .allowsHitTesting(false)
    .padding()
    .background(Color.gray.cornerRadius(8))
    .scaleEffect(configuration.isPressed ? 1.95 : 1)
  }
}
struct RoundedEdge: ViewModifier {
    let width: CGFloat
    let color: Color
    let cornerRadius: CGFloat

    func body(content: Content) -> some View {
        content.cornerRadius(cornerRadius - width)
            .padding(width)
            .background(color)
            .cornerRadius(cornerRadius)
    }
}

