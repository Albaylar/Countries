//
//  Constants.swift
//  Countries
//
//  Created by Furkan Deniz Albaylar on 6.08.2022.
//
import SwiftUI


struct RoundedRectangleButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    Button(action: {}, label: {
        configuration.label.foregroundColor(.white)
      }
    )
    .allowsHitTesting(false)
    .padding()
    .background(Color.gray.cornerRadius(8))
    .scaleEffect(configuration.isPressed ? 0.95 : 1)
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
//RapidAPI user key and host

struct Constant {
    static let host = "wft-geo-db.p.rapidapi.com"
    static let apiKey = "1d05ef09bamsh070c519a67e4370p159c0bjsn55a3e211dd9b"
}






