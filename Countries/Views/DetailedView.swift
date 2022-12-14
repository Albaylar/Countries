//
//  DetailedView.swift
//  Countries
//
//  Created by Furkan Deniz Albaylar on 6.08.2022.
//
import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
  @ObservedObject var networkingManager = FetchCountryDetails()
  @EnvironmentObject var favorites: FavoriteCountries
  @State var countryDetails: CountryDetail?
  var shouldUpdateFavorites: Binding<Bool>?
  let countryCode: String
  var body: some View {
      VStack (){
      if countryDetails?.data == nil {
        ProgressView()
      } else {
        ScrollView{
          if let BeforeDetail = countryDetails?.data {
              VStack(alignment: .leading, spacing: 25) {
              WebImage(url: URL(string: BeforeDetail.flagImageURI))
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 20))
            VStack{
              HStack {
                Text("Country Code:")
                .fontWeight(.heavy)
                Text(BeforeDetail.code)
              }
            }
              Link("For more information -> ", destination: URL(string: "https://www.wikidata.org/wiki/\(BeforeDetail.wikiDataID)")!)
                      .padding()
                      .background(Color.init(red: 0, green: 0, blue: 1))
                      .foregroundColor(.white)
                      .font(.subheadline)
            }
          }
        }
        .padding(.all)
      }
    }
    .onAppear{
        FetchCountryDetails().fetchCountryDetails( countryCode: countryCode) { (countryDetails) in
        self.countryDetails = countryDetails
      }
    }.onDisappear{
      self.shouldUpdateFavorites?.wrappedValue = true
    }
    .navigationTitle(countryDetails?.data.name ?? "")
    .navigationBarTitleDisplayMode(.inline)
    .toolbar {
      Button{
        favorites.CountryToggle(countryCode)
      } label: {
        Image(systemName: favorites.contains(countryCode) ? "star.fill" : "star").foregroundColor(.black)
      }
    }.buttonStyle(BorderlessButtonStyle()).labelStyle(.automatic)
          .padding(.horizontal, 5)
  }
}



